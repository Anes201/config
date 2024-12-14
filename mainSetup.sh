set_mirror() {
sudo netselect-apt
sudo netselect-apt -c fr
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak  # Backup your old sources list
}

install_core() { 
sudo apt-get update -y
sudo apt-get install zsh git curl wget rofi xsel ranger neofetch exa htop tmux redshift tree nano vim 7zip unrar-free telnet iw
sudo apt-get install python3-pip python3-venv python-is-python3 golang pipx proxychains
sudo apt-get install firefox chromium ripgrep audacious evince lm-sensors geany yt-dlp psensor tor
sudo apt-get install ffuf sqlmap nmap sublist3r dirsearch masscan wfuzz wapiti dnsmap gobuster gron jq netcat-traditional
sudo apt-get install xq yq whois yersinia dirb urlextractor dnsenum dnsrecon fierce knockpy recon-ng whatweb wafw00f
#sudo apt-get install awscli  ftp httrack hydra  medusa ncrack                       

curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh

git config --global credential.helper store
git config --global credential.helper cache
}

install_other() {
sudo add-apt-repository ppa:slgobinath/safeeyes
sudo apt install safeeyes
}

install_qemu() {
sudo apt install qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
sudo usermod -aG libvirt $(whoami)
sudo systemctl enable --now libvirtd
# sudo apt-get install -y spice-vdagent
}

install_core


