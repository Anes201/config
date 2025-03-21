#!/bin/bash

# Improved script to automate Linux configuration installation

set -e # Exit immediately if a command exits with a non-zero status

# --- Helper Functions ---

msg() {
  echo -e "\e[1m\e[34m>> $1\e[0m"
}

error() {
  echo -e "\e[1m\e[31m>> Error: $1\e[0m"
}

ask_yn() {
  read -r -p "$1 (y/N): " response
  case "$response" in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

check_sudo() {
  if [[ "$EUID" -ne 0 ]]; then
    error "This script requires sudo privileges. Please run it with sudo."
    exit 1
  fi
}

check_command() {
  if ! command -v "$1" &> /dev/null; then
    error "$1 is not installed. Please install it before proceeding."
    return 1
  fi
  return 0
}

# --- Installation Functions ---

set_mirror() {
  msg "Setting up the APT mirror..."
  if check_command netselect-apt; then
    msg "Running netselect-apt to find the fastest mirror..."
    sudo netselect-apt
    if ask_yn "Do you want to select a mirror specifically from France?"; then
      sudo netselect-apt -c fr
    fi
    sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak 2>/dev/null # Backup silently if it exists
    sudo cp /tmp/sources.list /etc/apt/sources.list
    msg "APT mirror has been set."
  else
    error "netselect-apt is not installed. Please install it manually or skip this step."
  fi
}

install_packages() {
  local packages=("$@")
  msg "Installing packages: ${packages[*]}"
  sudo nala update 
  sudo nala install "${packages[@]}" -y
  msg "Packages installed."
}

install_system() {
  msg "Installing essential system packages..."
  install_packages nala zsh git curl wget xsel ranger htop tmux tree nano 7zip unrar-free telnet iw vnstat moreutils rofi xclip bat btop lsd translate-shell jq poppler-utils fd-find ripgrep fzf zoxide detox duf hyperfine python3-pip python3-venv python-is-python3 golang pipx proxychains tor netcat-traditional speedtest-cli net-tools yt-dlp lm-sensors dconf-editor docker.io docker-compose
  msg "Essential system packages installed."

  msg "Installing cht.sh..."
  if ! [[ -f /usr/local/bin/cht.sh ]]; then
    curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
    msg "cht.sh installed."
  else
    msg "cht.sh is already installed."
  fi

  msg "Configuring Git credentials..."
  git config --global credential.helper store
  git config --global credential.helper cache
  msg "Git credentials configured."
}

install_gui() {
  msg "Installing GUI applications..."
  install_packages firefox chromium audacious evince geany psensor redshift
  if check_command add-apt-repository; then
    if ! grep -q "deb http://ppa.launchpad.net/slgobinath/safeeyes/ubuntu" /etc/apt/sources.list*; then
      sudo add-apt-repository ppa:slgobinath/safeeyes -y
      sudo nala update -y
      sudo nala install safeeyes -y
      msg "SafeEyes installed."
    else
      msg "SafeEyes PPA already added."
    fi
  else
    error "add-apt-repository command not found. Cannot install SafeEyes automatically."
  fi
  msg "GUI applications installed."
}

install_ai() {
  msg "Installing AI related tools..."
  if check_command pipx; then
    pipx install llm
    msg "llm installed via pipx."
  else
    error "pipx is not installed. Cannot install llm."
  fi

  if ! [[ -f /usr/local/bin/tgpt ]]; then
    curl -sSL https://raw.githubusercontent.com/aandrew-me/tgpt/main/install | sudo bash -s /usr/local/bin
    msg "tgpt installed."
  else
    msg "tgpt is already installed."
  fi

  if ! [[ -f fabric ]]; then
    curl -L https://github.com/danielmiessler/fabric/releases/latest/download/fabric-linux-amd64 -o fabric && chmod +x fabric && ./fabric --version
    sudo mv fabric /usr/local/bin/
    msg "fabric installed."
  else
    msg "fabric is already installed."
  fi
  msg "AI related tools installed."
}

install_basic_hunting() {
  msg "Installing basic hunting tools..."
  install_packages ffuf sqlmap nmap sublist3r dirsearch masscan wfuzz wapiti dnsmap gobuster gron jq xq yq whois yersinia dirb urlextractor dnsenum dnsrecon fierce knockpy whatweb wafw00f tcpdump openvpn httpie ncrack hashcat cupp
  msg "Basic hunting tools installed."
}

install_zsh() {
  msg "Installing Zsh and Powerlevel10k..."
  install_packages zsh wget
  if [[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    msg "Powerlevel10k cloned."
  else
    msg "Powerlevel10k already present."
  fi

  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    msg "Oh My Zsh installed."
  else
    msg "Oh My Zsh is already installed."
  fi
  msg "Zsh configured."
}

install_nvim() {
  msg "Installing Neovim and LazyVim..."
  install_packages nvim
  if [[ -d "$HOME/.config/nvim" ]]; then
    if ask_yn "Do you want to backup your current Neovim configuration?"; then
      mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d%H%M%S)
    else
      rm -rf ~/.config/nvim
    fi
  fi
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
  msg "Neovim with LazyVim installed."
}

install_qemu() {
  msg "Installing QEMU and virtualization tools..."
  install_packages qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
  sudo usermod -aG libvirt "$(whoami)"
  sudo systemctl enable --now libvirtd
  msg "QEMU and virtualization tools installed. You might need to log out and back in for group changes to take effect."
}

set_tools_dir() {
  local TOOLS_DIR="$HOME/recon/tools"
  msg "Setting up tools directory at $TOOLS_DIR..."
  mkdir -p "$TOOLS_DIR"
  cd "$TOOLS_DIR"
  msg "Tools directory created and entered."
}

set_python() {
  msg "Setting up custom Python scripts..."
  if [[ -f pyvenv ]]; then
    sudo cp pyvenv /usr/local/bin/pyvenv
    sudo chmod +x /usr/local/bin/pyvenv
    msg "pyvenv installed to /usr/local/bin."
  else
    msg "pyvenv not found in the current directory."
  fi

  if [[ -f pyget ]]; then
    sudo cp pyget /usr/local/bin/pyget
    sudo chmod +x /usr/local/bin/pyget
    msg "pyget installed to /usr/local/bin."
  else
    msg "pyget not found in the current directory."
  fi
}

set_proxychains() {
  msg "Setting up Proxychains with Tor..."
  install_packages tor
  if [[ -f proxychains.conf ]]; then
    sudo cp proxychains.conf /etc/proxychains.conf
    msg "Custom proxychains.conf copied to /etc/."
  else
    msg "proxychains.conf not found in the current directory. Using default configuration."
  fi
  sudo systemctl restart tor
  msg "Tor service restarted."
}

set_profile() {
  msg "Copying profile configurations..."
  cp .bashrc ~/.bashrc 2>/dev/null
  cp .bash_profile ~/.bash_profile 2>/dev/null
  cp .zshrc ~/.zshrc 2>/dev/null
  msg "Profile configurations copied."

  msg "Sourcing profile files..."
  source ~/.bash_profile 2>/dev/null
  source ~/.zshrc 2>/dev/null
  msg "Profile files sourced."
}

install_golang() {
  local GO_VERSION="1.23.4"
  msg "Installing Go version $GO_VERSION..."
  if ! [[ -d /usr/local/go ]]; then
    wget "https://dl.google.com/go/$GO_VERSION.linux-amd64.tar.gz"
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf "go$GO_VERSION.linux-amd64.tar.gz"
    rm "go$GO_VERSION.linux-amd64.tar.gz"
    echo "export PATH=\$PATH:/usr/local/go/bin" >>~/.bash_profile
    echo "export PATH=\$PATH:/usr/local/go/bin" >>~/.zshrc
    msg "Go $GO_VERSION installed to /usr/local/go."
  else
    msg "Go is already installed in /usr/local/go."
  fi
  msg "Remember to open a new terminal or run 'source ~/.bash_profile' and 'source ~/.zshrc' to update your PATH."
}

install_kali_minimal() {
  msg "Installing minimal Kali Linux tools..."
  sudo nala update && sudo nala install -y --no-install-recommends \
    7zip \
    amass \
    assetfinder \
    dirb \
    dirsearch \
    dnsx \
    dumpsterdiver \
    ffuf \
    finalrecon \
    gitleaks \
    gobuster \
    gospider \
    hakrawler \
    httprint \
    httprobe \
    httpx-toolkit \
    httrack \
    iw \
    jsp-file-browser \
    masscan \
    massdns \
    medusa \
    naabu \
    ncrack \
    nikto \
    nmap \
    nuclei \
    payloadsallthethings \
    pipx \
    proxychains4 \
    python-is-python3 \
    sqlmap \
    subfinder \
    sublist3r \
    telnet \
    unrar \
    wfuzz \
    whatweb \
    whois \
    witnessme \
    wpscan \
    awscli \
    dnsrecon \
    eyewitness \
    ftp \
    hydra \
    seclists \
    theharvester \
    recon-ng \
    waybackurls
  msg "Minimal Kali Linux tools installed."
}

install_kali_tools() {
  msg "Installing a large set of Kali Linux tools. This might take a while..."
  sudo nala update && sudo nala install -y --no-install-recommends \
    0trace 7zip aesfix aeskeyfind aircrack-ng altdns amass apache-users arjun arping asleap assetfinder atftpd autopsy axel b374k berate-ap bettercap-ui bind9-dnsutils bing-ip2hosts bloodyad bluez braa bruteforce-luks bruteforce-salted-openssl bruteforce-wallet brutespray bully calicoctl capstone-tool ccrypt certgraph chainsaw chisel chntpw cisco7crack cisco-auditing-tool cloudbrute cmseek cntlm colly cowpatty crack creddump7 cri-tools crunch cryptcat cupid-hostapd cupid-wpasupplicant davtest dbd dirb dirsearch dislocker dmitry dns2tcp dnscat2 dnschef dnsenum dnsgen dnsmap dnsrecon dnstracer dnswalk dnsx dos2unix dotdotpwn dscan dumpsterdiver dwarf2json eapmd5pass email2phonenumber emailharvester ethtool evilginx2 evil-ssdp exiflooter exiv2 expect fatcat ffuf fierce finalrecon firewalk fping fragrouter freeradius ftester gdisk getallurls getsploit gitleaks gobuster godoh golang-github-binject-go-donut goldeneye goofile google-nexus-tools gophish goshs gospider gpart gpp-decrypt graudit h8mail hak5-wifi-coconut hakrawler hamster-sidejack hashdeep hashid hash-identifier hashrat hb-honeypot hcxtools heartleech hekatomb horst hostapd-mana hotpatch hping3 htshells httprint httprobe httpx-toolkit httrack ident-user-enum ifenslave ike-scan impacket-scripts inetsim inspy instaloader intrace iodine ipv6toolkit irpas ismtp iw joomscan jsp-file-browser knocker koadic kustomize lapsdumper laudanum lbd libimage-exiftool-perl ligolo-ng linux-exploit-suggester macchanger maskprocessor masscan massdns mdbtools mdk3 mdk4 medusa merlin-agent merlin-server mimikatz minicom miredo mssqlpwner multiforcer multimac mxcheck naabu name-that-hash nasm nbtscan nbtscan nbtscan-unixwiz ncat ncrack ncrack ncurses-hexedit netcat-traditional netdiscover netdiscover netexec netmask netmask netscanner netsed netsniff-ng nextnet nfs-common ngrep nikto nipper-ng nishang nmap nuclei ohrwurm onesixtyone onesixtyone o-saft outguess owl p0f parsero passdetective payloadsallthethings pdfid pdf-parser pdf-parser peirates phishery photon phpggc phpsploit pipal pipx pixiewps pixiewps plocate pnscan pompem portspoof princeprocessor proxify proxify proximoth proxychains4 proxytunnel pskracker pspy ptunnel pwnat pwncat pyinstxtractor python3-ldapdomaindump python3-wsgidav python-is-python3 qsslcaudit rake raven reaver rebind reconspider redsocks reglookup rephrase responder rfkill ridenum rling robotstxt ropper routersploit rsmangler rtpbreak rtpflood rtpinsertsound rtpmixsound ruby-pedump s3scanner sakis3g samba samdump2 sara sbd scalpel screen scrounge-ntfs sctpscan sendemail sentrypeer sfuzz sharpshooter shed shellfire sickle-tool sidguesser siege sigma-cli silenttrinity siparmyknife sipp sipsak skipfish skipfish sleuthkit slowhttptest smbmap sn0int snmp snmpcheck snmpd snmpenum snowdrop socat spike spike sploitscan spooftooph sqlmap sqlmc sqlninja sqlsus ssldump sslh sslscan sslsniff sslsplit sslstrip sslyze statsprocessor stegcracker steghide stegsnow stunnel4 subfinder subjack sublist3r swaks syft t50 tcpdump tcpflow tcpick tcpreplay telnet testdisk testssl.sh tftp-hpa thc-ipv6 thc-pptp-bruter thc-ssl-dos tlssled tnscmd10g traceroute truecrack trufflehog tundeep udptunnel unblob undbx unhide unhide.rb uniscan unix-privesc-check unrar upx-ucl vboot-kernel-utils vboot-utils villain vlan voiphopper vpnc wafw00f wapiti waybackpy wce wce webacoo web-cache-vulnerability-scanner webshells weevely wfuzz wgetpaste whatmask whatweb whois wifi-honey wig wig-ng windows-binaries winexe witnessme wmi-client wordlistraider wpa-sycophant wpscan xmount xsrfprobe xxd yara yersinia zonedb recon-ng
  msg "Large set of Kali Linux tools installed."
}

install_python_tools() {
  msg "Installing additional Python tools..."
  if check_command git pipx pyget; then
    git clone https://github.com/nahamsec/crtndstry
    msg "crtndstry cloned."

    pipx install bbot uro json2paths parth proxify GitHacker
    msg "bbot uro json2paths parth proxify GitHacker installed via pipx."

    pyget https://github.com/xnl-h4ck3r/xnLinkFinder
    pyget https://github.com/m4ll0k/SecretFinder
    pyget https://github.com/GerbenJavado/LinkFinder
    pyget https://github.com/codingo/NoSQLMap
    pyget https://github.com/claymation/python-builtwith
    pyget https://github.com/WangYihang/GitHacker
    pyget https://github.com/guelfoweb/knock
    pyget https://github.com/s0md3v/XSStrike
    pyget https://github.com/s0md3v/Bolt
    pyget https://github.com/s0md3v/Breacher
    pyget https://github.com/s0md3v/Decodify
    pyget https://github.com/s0md3v/Striker
    pyget https://github.com/s0md3v/Silver
    pyget https://github.com/s0md3v/Zen
    pyget https://github.com/hisxo/gitGraber
    pyget https://github.com/shmilylty/OneForAll
    msg "Additional Python tools installed."
  else
    error "git, pipx, or pyget not found. Cannot install additional Python tools."
  fi
}

install_go_tools() {
  msg "Installing Go tools..."
  if check_command go; then
    export CGO_ENABLED=1
    go install github.com/projectdiscovery/katana/cmd/katana@latest
    go install github.com/projectdiscovery/cvemap/cmd/cvemap@latest
    go install github.com/projectdiscovery/tldfinder/cmd/tldfinder@latest
    go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest
    go install -v github.com/projectdiscovery/urlfinder/cmd/urlfinder@latest
    go install -v github.com/projectdiscovery/cdncheck/cmd/cdncheck@latest
    go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest
    go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
    go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
    go install -v github.com/projectdiscovery/proxify/cmd/proxify@latest
    go install github.com/projectdiscovery/alterx/cmd/alterx@latest
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

    go install github.com/tomnomnom/unfurl@latest
    go install github.com/tomnomnom/meg@latest
    go install -v github.com/tomnomnom/anew@latest
    go install github.com/tomnomnom/httprobe@latest
    go install github.com/tomnomnom/waybackurls@latest
    go install github.com/tomnomnom/qsreplace@latest

    export GO111MODULE=on
    go install -v github.com/lc/subjs@latest
    go install -v github.com/musana/fuzzuli@latest
    go install github.com/dwisiswant0/unew
    go install github.com/gwen001/github-subdomains@latest
    go install -v github.com/s0md3v/smap/cmd/smap@latest
    go install github.com/lc/gau/v2/cmd/gau@latest

    go install github.com/charmbracelet/glow@latest
    msg "Go tools installed."
  else
    error "Go is not installed. Cannot install Go tools."
  fi
}

install_hunting_config() {
  msg "Installing hunting configurations and tools..."
  if check_command git; then
    if [[ ! -d "$HOME/bbht" ]]; then
      git clone https://github.com/nahamsec/bbht.
      cd bbht
      chmod +x install.sh
      ./install.sh
      cd ..
      msg "bbht installed."
    else
      msg "bbht already present."
    fi

    if [[ ! -d "$HOME/recon_profile" ]]; then
      git clone https://github.com/nahamsec/recon_profile.git
      msg "recon_profile cloned."
    else
      msg "recon_profile already present."
    fi

    if [[ ! -d "$HOME/juice-shop" ]]; then
      git clone https://github.com/juice-shop/juice-shop.git --depth 1
      msg "juice-shop cloned."
    else
      msg "juice-shop already present."
    fi

    if [[ ! -d "$HOME/pimpmykali" ]]; then
      git clone https://github.com/Dewalt-arch/pimpmykali.git
      cd pimpmykali
      sudo ./pimpmykali.sh
      cd ..
      msg "pimpmykali installed."
    else
      msg "pimpmykali already present."
    fi

    install_packages seclists
    msg "seclists installed."
  else
    error "git is not installed. Cannot install hunting configurations."
  fi
}

# --- Main Menu ---

main_menu() {
  check_sudo

  while true; do
    msg "Linux Configuration Installation Script"
    echo "---------------------------------------"
    echo "1. Set APT Mirror"
    echo "2. Install Essential System Packages"
    echo "3. Install GUI Applications"
    echo "4. Install AI Related Tools"
    echo "5. Install Basic Hunting Tools"
    echo "6. Install Zsh and Configure"
    echo "7. Install Neovim with LazyVim"
    echo "8. Install QEMU and Virtualization Tools"
    echo "9. Set Tools Directory"
    echo "10. Set Custom Python Scripts (pyvenv, pyget)"
    echo "11. Set Proxychains with Tor"
    echo "12. Copy Profile Configurations (.bashrc, .zshrc)"
    echo "13. Install Go"
    echo "14. Install Minimal Kali Linux Tools"
    echo "15. Install Full Kali Linux Tools (Warning: Large)"
    echo "16. Install Additional Python Tools"
    echo "17. Install Go Tools"
    echo "18. Install Hunting Configurations and Tools"
    echo "19. Run All (Recommended for fresh install)"
    echo "20. Exit"
    echo "---------------------------------------"
    read -r -p "Select an option: " choice

    case "$choice" in
      1) set_mirror ;;
      2) install_system ;;
      3) install_gui ;;
      4) install_ai ;;
      5) install_basic_hunting ;;
      6) install_zsh ;;
      7) install_nvim ;;
      8) install_qemu ;;
      9) set_tools_dir ;;
      10) set_python ;;
      11) set_proxychains ;;
      12) set_profile ;;
      13) install_golang ;;
      14) install_kali_minimal ;;
      15) install_kali_tools ;;
      16) install_python_tools ;;
      17) install_go_tools ;;
      18) install_hunting_config ;;
      19)
        set_mirror
        install_system
        install_gui
        install_ai
        install_basic_hunting
        install_zsh
        install_nvim
        install_qemu
        set_python
        install_golang
        set_tools_dir
        set_profile
        set_proxychains
        install_hunting_config
        ;;
      20) msg "Exiting."; exit 0 ;;
      *) error "Invalid option. Please try again." ;;
    esac
  done
}

# --- Script Execution ---

if ask_yn "Do you want to run the script in interactive menu mode?"; then
  main_menu
else
  msg "Running the default installation sequence..."
  set_mirror
  install_system
  install_ai
  install_gui
  install_basic_hunting
  # install_zsh
  # install_nvim
  # install_qemu
  # set_python
  # install_golang
  # set_tools_dir
  # set_profile
  # set_proxychains
  # install_kali_minimal
  # install_kali_core
  # install_python_tools
  # install_go_tools
  # install_hunting_config
  msg "Default installation sequence completed. Check commented-out sections to enable more installations."
fi

msg "Installation script finished."
