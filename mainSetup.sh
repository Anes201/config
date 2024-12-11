sudo netselect-apt
sudo netselect-apt -c fr
sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak  # Backup your old sources list

sudo apt-get update
sudo apt-get install git curl wget tree ripgrep exa neofetch nnn bat audacious xsel evince redshift lm-sensors geany yt-dlp rofi tmux  psensor htop
sudo apt-get install python3-pip python3-venv python-is-python3 golang pipx
sudo apt-get install firefox chromium 

#cheats for everything
curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh

sudo add-apt-repository ppa:slgobinath/safeeyes
sudo apt install safeeyes

git config --global credential.helper store
git config --global credential.helper cache


# qemu
sudo apt install qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager
sudo usermod -aG libvirt $(whoami)
sudo systemctl enable --now libvirtd

# sudo apt-get install -y spice-vdagent

# local llm
curl -fsSL https://ollama.com/install.sh | sh
ollama run llama3.2

docker pull owasp/nettacker