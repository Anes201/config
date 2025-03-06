set_mirror() {
  sudo netselect-apt
  sudo netselect-apt -c fr
  sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak # Backup your old sources list
}

install_system() {
  sudo apt-get update -y
  sudo apt-get -y install nala zsh git curl wget xsel ranger fastfetch htop tmux tree nano nvim 7zip unrar-free telnet iw vnstat moreutils rofi
  sudo apt-get -y install xclip bat btop lsd translate-shell 7zip jq poppler-utils fd-find ripgrep fzf zoxide detox duf hyperfine
  sudo apt-get -y install python3-pip python3-venv python-is-python3 golang pipx proxychains tor
  sudo apt-get -y install netcat-traditional speedtest-cli net-tools yt-dlp lm-sensors dconf-editor

  curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh

  git config --global credential.helper store
  git config --global credential.helper cache
}

install_gui() {
  sudo apt-get install firefox-esr chromium audacious evince geany psensor redshift
  sudo add-apt-repository ppa:slgobinath/safeeyes
  sudo apt install safeeyes
}

install_basic_hunting() {
    sudo apt-get -y install ffuf sqlmap nmap sublist3r dirsearch masscan wfuzz wapiti dnsmap gobuster gron jq
    sudo apt-get -y install xq yq whois yersinia dirb urlextractor dnsenum dnsrecon fierce knockpy recon-ng whatweb wafw00f
    sudo apt-get -y install arp tcpdump sniffnet openvpn httpie
    sudo apt-get -y install ncrack hashcat cupp
}

install_zsh() {
  sudo apt install zsh wget
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_nvim() {
  sudo apt-get -y nvim
  # required
  mv ~/.config/nvim{,.bak}
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
}

install_qemu() {
  sudo apt install qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
  sudo usermod -aG libvirt $(whoami)
  sudo systemctl enable --now libvirtd
  # sudo apt-get install -y spice-vdagent
}

# kali specific
set_tools_dir() {
  TOOLS_DIR= ~/recon/tools
  if [ ! -d "$TOOLS_DIR" ]; then
    mkdir "$TOOLS_DIR"
  fi
  cd ~/tools
}

set_python() {
  if [[ -f pyvenv ]]; then
    sudo cp pyvenv /usr/local/bin/pyvenv
    sudo chmod +x /usr/local/bin/pyvenv
  fi

  if [[ -f pyget ]]; then
    sudo cp pyget /usr/local/bin/pyget
    sudo chmod +x /usr/local/bin/pyget
  fi
}

set_proxychains() {
  sudo apt install tor
  if [[ -f proxychains.conf ]]; then
    cp proxychains.conf /etc/proxychains.conf
  fi
  sudo systemctl restart tor
}

set_profile() {
  cp .bashrc ~/.bashrc
  cp .bash_profile ~/.bash_profile
  cp .zshrc ~/.zshrc

  source ~/.bash_profile
  source ~/.zshrc
}

install_golang() {
  GO_VERSION="1.23.4"
  wget https://dl.google.com/go/$GO_VERSION.linux-amd64.tar.gz
  rm -rf /usr/local/go && tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
  rm go$GO_VERSION.linux-amd64.tar.gz

  export PATH=$PATH:/usr/local/go/bin >>~/.bash_profile
  export PATH=$PATH:/usr/local/go/bin >>~/.zshrc

  source ~/.bash_profile
  source ~/.zshrc
}

install_kali_minimal() {
    sudo apt update && apt install -y --no-install-recommends \
    7zip						            \
    amass                                   \
    assetfinder		                        \
    dirb                                    \
    dirsearch                               \
    dnsx                                    \
    dumpsterdiver                           \
    ffuf                                    \
    finalrecon                              \
    gitleaks                                \
    gobuster                                \
    gospider                                \
    hakrawler                               \
    httprint                                \
    httprobe                                \
    httpx-toolkit                           \
    httrack                                 \
    iw                                      \
    jsp-file-browser                        \
    masscan                                 \
    massdns                                 \
    medusa                                  \
    naabu                                   \
    ncrack                                  \
    nikto                                   \
    nmap                                    \
    nuclei                                  \
    payloadsallthethings                    \
    pipx                                    \
    proxychains4                            \
    python-is-python3                       \
    sqlmap                                  \
    subfinder                               \
    sublist3r                               \
    telnet 				                    \
    unrar                                   \
    wfuzz                                   \
    whatweb                                 \
    whois                                   \
    witnessme                               \
    wpscan                                  \
    awscli \
    dnsrecon \
    eyewitness \
    ftp \
    hydra \
    seclists \
    theharvester \
    recon-ng \
    waybackurls
}

install_kali_tools() {
  sudo apt update && apt install -y --no-install-recommends \
    0trace \
    7zip \
    aesfix \
    aeskeyfind \
    aircrack-ng \
    altdns \
    amass \
    apache-users \
    arjun \
    arping \
    asleap \
    assetfinder \
    atftpd \
    autopsy \
    axel \
    b374k \
    berate-ap \
    bettercap-ui \
    bind9-dnsutils \
    bing-ip2hosts \
    bloodyad \
    bluez \
    braa \
    bruteforce-luks \
    bruteforce-salted-openssl \
    bruteforce-wallet \
    brutespray \
    bully \
    calicoctl \
    capstone-tool \
    ccrypt \
    certgraph \
    chainsaw \
    chisel \
    chntpw \
    cisco7crack \
    cisco-auditing-tool \
    cloudbrute \
    cmseek \
    cntlm \
    colly \
    cowpatty \
    crack \
    creddump7 \
    cri-tools \
    crunch \
    cryptcat \
    cupid-hostapd \
    cupid-wpasupplicant \
    davtest \
    dbd \
    dirb \
    dirsearch \
    dislocker \
    dmitry \
    dns2tcp \
    dnscat2 \
    dnschef \
    dnsenum \
    dnsgen \
    dnsmap \
    dnsrecon \
    dnstracer \
    dnswalk \
    dnsx \
    dos2unix \
    dotdotpwn \
    dscan \
    dumpsterdiver \
    dwarf2json \
    eapmd5pass \
    email2phonenumber \
    emailharvester \
    ethtool \
    evilginx2 \
    evil-ssdp \
    exiflooter \
    exiv2 \
    expect \
    fatcat \
    ffuf \
    fierce \
    finalrecon \
    firewalk \
    fping \
    fragrouter \
    freeradius \
    ftester \
    gdisk \
    getallurls \
    getsploit \
    gitleaks \
    gobuster \
    godoh \
    golang-github-binject-go-donut \
    goldeneye \
    goofile \
    google-nexus-tools \
    gophish \
    goshs \
    gospider \
    gpart \
    gpp-decrypt \
    graudit \
    h8mail \
    hak5-wifi-coconut \
    hakrawler \
    hamster-sidejack \
    hashdeep \
    hashid \
    hash-identifier \
    hashrat \
    hb-honeypot \
    hcxtools \
    heartleech \
    hekatomb \
    horst \
    hostapd-mana \
    hotpatch \
    hping3 \
    htshells \
    httprint \
    httprobe \
    httpx-toolkit \
    httrack \
    ident-user-enum \
    ifenslave \
    ike-scan \
    impacket-scripts \
    inetsim \
    inspy \
    instaloader \
    intrace \
    iodine \
    ipv6toolkit \
    irpas \
    ismtp \
    iw \
    joomscan \
    jsp-file-browser \
    knocker \
    koadic \
    kustomize \
    lapsdumper \
    laudanum \
    lbd \
    libimage-exiftool-perl \
    ligolo-ng \
    linux-exploit-suggester \
    macchanger \
    maskprocessor \
    masscan \
    massdns \
    mdbtools \
    mdk3 \
    mdk4 \
    medusa \
    merlin-agent \
    merlin-server \
    mimikatz \
    minicom \
    miredo \
    mssqlpwner \
    multiforcer \
    multimac \
    mxcheck \
    naabu \
    name-that-hash \
    nasm \
    nbtscan \
    nbtscan \
    nbtscan-unixwiz \
    ncat \
    ncrack \
    ncrack \
    ncurses-hexedit \
    netcat-traditional \
    netdiscover \
    netdiscover \
    netexec \
    netmask \
    netmask \
    netscanner \
    netsed \
    netsniff-ng \
    nextnet \
    nfs-common \
    ngrep \
    nikto \
    nipper-ng \
    nishang \
    nmap \
    nuclei \
    ohrwurm \
    onesixtyone \
    onesixtyone \
    o-saft \
    outguess \
    owl \
    p0f \
    parsero \
    passdetective \
    payloadsallthethings \
    pdfid \
    pdf-parser \
    pdf-parser \
    peirates \
    phishery \
    photon \
    phpggc \
    phpsploit \
    pipal \
    pipx \
    pixiewps \
    pixiewps \
    plocate \
    pnscan \
    pompem \
    portspoof \
    princeprocessor \
    proxify \
    proxify \
    proximoth \
    proxychains4 \
    proxytunnel \
    pskracker \
    pspy \
    ptunnel \
    pwnat \
    pwncat \
    pyinstxtractor \
    python3-ldapdomaindump \
    python3-wsgidav \
    python-is-python3 \
    qsslcaudit \
    rake \
    raven \
    reaver \
    rebind \
    reconspider \
    redsocks \
    reglookup \
    rephrase \
    responder \
    rfkill \
    ridenum \
    rling \
    robotstxt \
    ropper \
    routersploit \
    rsmangler \
    rtpbreak \
    rtpflood \
    rtpinsertsound \
    rtpmixsound \
    ruby-pedump \
    s3scanner \
    sakis3g \
    samba \
    samdump2 \
    sara \
    sbd \
    scalpel \
    screen \
    scrounge-ntfs \
    sctpscan \
    sendemail \
    sentrypeer \
    sfuzz \
    sharpshooter \
    shed \
    shellfire \
    sickle-tool \
    sidguesser \
    siege \
    sigma-cli \
    silenttrinity \
    siparmyknife \
    sipp \
    sipsak \
    skipfish \
    skipfish \
    sleuthkit \
    slowhttptest \
    smbmap \
    sn0int \
    snmp \
    snmpcheck \
    snmpd \
    snmpenum \
    snowdrop \
    socat \
    spike \
    spike \
    sploitscan \
    spooftooph \
    sqlmap \
    sqlmc \
    sqlninja \
    sqlsus \
    ssldump \
    sslh \
    sslscan \
    sslsniff \
    sslsplit \
    sslstrip \
    sslyze \
    statsprocessor \
    stegcracker \
    steghide \
    stegsnow \
    stunnel4 \
    subfinder \
    subjack \
    sublist3r \
    swaks \
    syft \
    t50 \
    tcpdump \
    tcpflow \
    tcpick \
    tcpreplay \
    telnet \
    testdisk \
    testssl.sh \
    tftp-hpa \
    thc-ipv6 \
    thc-pptp-bruter \
    thc-ssl-dos \
    tlssled \
    tnscmd10g \
    traceroute \
    truecrack \
    trufflehog \
    tundeep \
    udptunnel \
    unblob \
    undbx \
    unhide \
    unhide.rb \
    uniscan \
    unix-privesc-check \
    unrar \
    upx-ucl \
    vboot-kernel-utils \
    vboot-utils \
    villain \
    vlan \
    voiphopper \
    vpnc \
    wafw00f \
    wapiti \
    waybackpy \
    wce \
    wce \
    webacoo \
    web-cache-vulnerability-scanner \
    webshells \
    weevely \
    wfuzz \
    wgetpaste \
    whatmask \
    whatweb \
    whois \
    wifi-honey \
    wig \
    wig-ng \
    windows-binaries \
    winexe \
    witnessme \
    wmi-client \
    wordlistraider \
    wpa-sycophant \
    wpscan \
    xmount \
    xsrfprobe \
    xxd \
    yara \
    yersinia \
    zonedb \
    recon-ng
}

install_python_tools() {
  git clone https://github.com/nahamsec/crtndstry

  pipx install bbot
  pipx install uro
  pipx install json2paths
  pipx install parth
  pipx install proxify
  pipx install GitHacker

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
}

install_go_tools() {
  CGO_ENABLED=1 go install github.com/projectdiscovery/katana/cmd/katana@latest
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

  GO111MODULE=on go install -v github.com/lc/subjs@latest
  go install -v github.com/musana/fuzzuli@latest
  go install github.com/dwisiswant0/unew
  go install github.com/gwen001/github-subdomains@latest
  go install -v github.com/s0md3v/smap/cmd/smap@latest
  go install github.com/lc/gau/v2/cmd/gau@latest

  go install github.com/charmbracelet/glow@latest
}

install_hunting_config() {
  git clone https://github.com/nahamsec/bbht.
  cd bbht
  chmod +x install.sh
  ./install.sh
  git clone https://github.com/nahamsec/recon_profile.git
  git clone https://github.com/juice-shop/juice-shop.git --depth 1
  git clone https://github.com/Dewalt-arch/pimpmykali.git
  cd pimpmykali
  sudo ./pimpmykali.sh
  sudo apt install seclists
}


install_system
install_gui
#install_zsh
#install_nvim
install_basic_hunting
#install_qemu
#set_python
#install_golang
#set_tools_dir
#set_profile
#set_proxychains
#install_kali_minimal
#install_kali_core
#install_python_tools
#install_go_tools
#install_hunting_config
