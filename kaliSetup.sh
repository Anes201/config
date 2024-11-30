
# configs
sudo cp pyvenv /usr/local/bin/pyvenv
sudo chmod +x /usr/local/bin/pyvenv
sudo cp pyget /usr/local/bin/pyget
sudo chmod +x /usr/local/bin/pyget

# repo installs
sudo apt update -y
sudo apt install -y curl wget vim git whois netcat-traditional
sudo apt install -y python3-pip golang pipx python-is-python3
sudo apt install -y spiderfoot 
sudo apt install -y sherlock 
sudo apt install -y dirsearch 
sudo apt install -y hydra 
sudo apt install -y dirsearch 
sudo apt install -y ffuf 
sudo apt install -y wfuzz 
sudo apt install -y sublist3r 
sudo apt install -y wpscan 
sudo apt install -y amass 
sudo apt install -y hashcat 
sudo apt install -y masscan
sudo apt install -y netcat 
sudo apt install -y nikto 
sudo apt install -y nmap 
sudo apt install -y pipx 
sudo apt install -y openvpn 
sudo apt install -y recon-ng 
sudo apt install -y sqlmap 
sudo apt install -y telnet 
sudo apt install -y theharvester 
sudo apt install -y whois
sudo apt install -y gowitness
sudo apt install -y aquatone
sudo apt install -y waybackurls
sudo apt install -y dirsearch
sudo apt install -y gospider
sudo apt install -y fierce
sudo apt install -y dnsgen
sudo apt install -y https
sudo apt install -y meg
sudo apt install -y nuclei
sudo apt install -y hakrawler
sudo apt install -y assetfinder
sudo apt install -y naabu
sudo apt install -y eyewitness
sudo apt install -y massdns
sudo apt install -y httprobe
# large size
#sudo apt install -y wordlists
#sudo apt install -y feroxbuster 
#sudo apt install -y seclists 

# 
pipx install bbot
pipx install arjun
pipx install uro
pipx install json2paths
pipx install parth
pipx install proxify


pyget https://github.com/xnl-h4ck3r/xnLinkFinder
pyget https://github.com/m4ll0k/SecretFinder
pyget https://github.com/GerbenJavado/LinkFinder
pyget https://github.com/codingo/NoSQLMap
pyget https://github.com/claymation/python-builtwith
pyget https://github.com/xnl-h4ck3r/xnLinkFinder.git
pyget https://github.com/WangYihang/GitHacker
pyget https://github.com/m4ll0k/SecretFinder
pyget https://github.com/securing/DumpsterDiver
https://github.com/guelfoweb/knock
https://github.com/s0md3v/XSStrike
https://github.com/s0md3v/Photon
https://github.com/s0md3v/Bolt
https://github.com/s0md3v/Breacher
https://github.com/s0md3v/Decodify
https://github.com/s0md3v/Striker
https://github.com/s0md3v/Silver
https://github.com/s0md3v/Zen

# go installations
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
CGO_ENABLED=1 go install github.com/projectdiscovery/katana/cmd/katana@latest
go install github.com/gwen001/github-subdomains@latest
go install github.com/projectdiscovery/cvemap/cmd/cvemap@latest
go install github.com/projectdiscovery/tldfinder/cmd/tldfinder@latest
go install github.com/projectdiscovery/asnmap/cmd/asnmap@latest
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/s0md3v/smap/cmd/smap@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install -v github.com/projectdiscovery/urlfinder/cmd/urlfinder@latest
go install -v github.com/projectdiscovery/cdncheck/cmd/cdncheck@latest
go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
go install -v github.com/projectdiscovery/proxify/cmd/proxify@latest
go install github.com/projectdiscovery/alterx/cmd/alterx@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/unfurl@latest

GO111MODULE=on go install -v github.com/lc/subjs@latest
go install -v github.com/musana/fuzzuli@latest
go install github.com/OJ/gobuster/v3@latest


