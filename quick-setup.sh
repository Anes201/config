

# system
sudo apt nala zsh git curl wget xsel ranger htop tmux tree nano 7zip unrar-free telnet iw vnstat moreutils rofi xclip btop translate-shell jq poppler-utils ripgrep fzf detox duf hyperfine python3-pip python3-venv python-is-python3 golang pipx proxychains tor netcat-traditional speedtest-cli net-tools yt-dlp lm-sensors dconf-editor docker.io docker-compose


git config --global credential.helper store
git config --global credential.helper cache

sudo add-apt-repository ppa:safeeyes-team/safeeyes
sudo nala update
sudo nala install safeeyes

curl -L https://github.com/danielmiessler/fabric/releases/latest/download/fabric-linux-amd64 -o fabric && chmod +x fabric && ./fabric --version
sudo mv fabric /usr/local/bin/

sudo apt install firefox chromium audacious evince geany psensor redshift -y

# code

# 1. Add Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

# 2. Add the VSCode repo
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | \
  sudo tee /etc/apt/sources.list.d/vscode.list

# 3. Update and install
sudo apt update
sudo apt install code

# 1. Install transport packages
sudo apt install -y curl gnupg

# 2. Add Brave’s GPG key
curl -fsSL https://brave.com/signing-key.asc | sudo gpg --dearmor -o /usr/share/keyrings/brave-browser-archive-keyring.gpg

# 3. Add Brave repo to sources list
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | \
  sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# 4. Update and install
sudo apt update
sudo apt install brave-browser
