
git config --global credential.helper store
git config --global credential.helper cache

sudo add-apt-repository ppa:slgobinath/safeeyes
sudo apt install safeeyes

#cheats for everything
curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
sudo apt-get install -y tldr


if vm
sudo apt-get install -y spice-vdagent
system installs


# move the configs
mkdir -p ~/.config/tmux && cp ./dotconfig/tmux.conf ~/.config/tmux/tmux.conf
mkdir -p ~/.config/htop && cp ./dotconfig/htoprc ~/.config/htop/htoprc
mkdir -p ~/.config/geany && cp -r ./dotconfig/geany ~/.config

# local llm
curl -fsSL https://ollama.com/install.sh | sh
ollama run llama3.2


# redshift alacritty python3-pip python3.10-venv geany audacious yt-dlp evince redshift magnus rofi xclicker freetube gnumeric vscodium protonvpn obsidian  curl htop lm-sensors fish git python-is-python3 acpi rofi tree tmux neofetch psensor
