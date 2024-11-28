apt-get update && apt-get install -y \
	neofetch \
	xsel \
	exa \
	fzf \
	nnn \
	batcat \
    curl \
    wget \
    vim \
    git \
    tree \
    ripgrep \
    jq \
    pipx \
    && apt-get clean

git config --global credential.helper store
git config --global credential.helper cache

