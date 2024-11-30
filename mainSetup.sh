#!/bin/bash

minimal_setup() {
    apt-get update && apt-get install -y \
	xsel \
	exa \
	nnn \
	bat \
    curl \
    wget \
    git \
    tree \
    ripgrep \
    && apt-get clean
}

full_setup() {
    echo "Performing full setup..."
    GO_VERSION=1.23.3

	# Update and install dependencies
	sudo apt-get update && apt-get install -y \
		jq \
		pipx \
		fzf \
		vim \
		neofetch \
		build-essential  \
	    python-dev \
		python-setuptools python3-pip python-pip \
		python-dnspython rename xargs \
		proxychains4 tor sublist3r \
		sqlmap ffuf nmap \
		golang-go \
        vim net-tools whois

        # Set GOROOT and GOPATH for the current session
        export GOROOT=/usr/local/go
        export GOPATH=$HOME/go
        export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

        # Add to .bash_profile for future sessions
        echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
        echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
        echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile

        # Apply the changes immediately
        source ~/.bash_profile

	# Create tools folder
	mkdir -p $HOME/tools
	cd $HOME/tools

	# Install tools using Go, Git, or apt
	declare -a tools=(
		"github.com/michenriksen/aquatone"
		"github.com/tomnomnom/httprobe"
		"github.com/tomnomnom/unfurl"
		"github.com/tomnomnom/waybackurls"
		"github.com/projectdiscovery/httpx/cmd/httpx"
		"github.com/PentestPad/subzy"
		"github.com/projectdiscovery/subfinder/v2/cmd/subfinder"
		"github.com/hakluke/hakrawler"
		"github.com/OJ/gobuster/v3"
		"github.com/ffuf/ffuf/v2"
	)

	for tool in "${tools[@]}"; do
		echo "Installing $tool"
		go install $tool@latest
	done

	# Clone repositories for other tools
	declare -a git_repos=(
		"https://github.com/wpscanteam/wpscan.git"
		"https://github.com/maurosoria/dirsearch.git"
		"https://github.com/nahamsec/lazys3.git"
		"https://github.com/jobertabma/virtual-host-discovery.git"
		"https://github.com/sqlmapproject/sqlmap.git"
		"https://github.com/guelfoweb/knock.git"
		"https://github.com/nahamsec/lazyrecon.git"
		"https://github.com/blechschmidt/massdns.git"
		"https://github.com/yassineaboukir/asnlookup.git"
		"https://github.com/nahamsec/crtndstry.git"
		"https://github.com/robertdavidgraham/masscan.git"
	)

	for repo in "${git_repos[@]}"; do
		echo "Cloning $repo"
		git clone $repo
	done

	# Build tools that need compilation (e.g., massdns, masscan)
	cd $HOME/tools/massdns
	make
	cd $HOME/tools/masscan
	make
	ln -sf $HOME/tools/masscan/bin/masscan /usr/local/bin/masscan

	# Install Python requirements
	cd $HOME/tools/asnlookup
	pipx install -r requirements.txt

	go install -v github.com/owasp-amass/amass/v4/...@master

	# Final message
	echo -e "\n\nAll tools are set up in $HOME/tools"
}


minimal_setup
full_setup

cp proxychains4.conf  /etc/proxychains4.conf
curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
