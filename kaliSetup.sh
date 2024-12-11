
# configs
mkdir ~/tools
cd ~/tools
sudo cp pyvenv /usr/local/bin/pyvenv
sudo chmod +x /usr/local/bin/pyvenv
sudo cp pyget /usr/local/bin/pyget
sudo chmod +x /usr/local/bin/pyget
cp proxychains.conf /etc/proxychains.conf
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile

GO_VERSION="1.23.3"
wget https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
rm go$GO_VERSION.linux-amd64.tar.gz

echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile

# Apply the changes immediately
source ~/.bash_profile

# repo installs
sudo apt update -y && sudo apt upgrade -y
# core
sudo apt install -y curl wget vim git whois netcat-traditional tmux nano
sudo apt install -y python3-pip golang pipx python-is-python3
sudo apt install ffuf dirb nmap sqlmap wfuzz
# web
RUN apt update && apt install -y --no-install-recommends \
0trace                                  \
7zip						            \
aesfix		                            \
aeskeyfind                              \
aircrack-ng			                    \
altdns                                  \
amass                                   \
apache-users                            \
arjun                                   \
arping			                        \
asleap                                  \
assetfinder		                        \
atftpd                                  \
autopsy				                    \
axel                                    \
b374k                                   \
berate-ap                               \
bettercap-ui                            \
bind9-dnsutils                          \
bing-ip2hosts                           \
bloodyad                                \
bluez				                    \
braa                                    \
bruteforce-luks                         \
bruteforce-salted-openssl               \
bruteforce-wallet                       \
brutespray                              \
bully                                   \
calicoctl                               \
capstone-tool                           \
ccrypt                                  \
certgraph                               \
chainsaw                                \
chisel                                  \
chntpw                                  \
cisco7crack                             \
cisco-auditing-tool                     \
cloudbrute                              \
cmseek                                  \
cntlm                                   \
colly                                   \
cowpatty                                \
crack                                   \
creddump7                               \
cri-tools                               \
crunch                                  \
cryptcat                                \
cupid-hostapd                           \
cupid-wpasupplicant                     \
davtest                                 \
dbd                                     \
dirb                                    \
dirsearch                               \
dislocker                               \
dmitry			                        \
dns2tcp                                 \
dnscat2                                 \
dnschef                                 \
dnsenum                                 \
dnsgen                                  \
dnsmap                                  \
dnsrecon                                \
dnstracer                               \
dnswalk			                        \
dnsx                                    \
dos2unix                                \
dotdotpwn                               \
dscan                                   \
dumpsterdiver                           \
dwarf2json                              \
eapmd5pass                              \
email2phonenumber                       \
emailharvester                          \
ethtool                                 \
evilginx2                               \
evil-ssdp                               \
exiflooter                              \
exiv2                                   \
expect                                  \
fatcat                                  \
ffuf                                    \
fierce                                  \
finalrecon                              \
firewalk                                \
fping                                   \
fragrouter                              \
freeradius                              \
ftester                                 \
gdisk                                   \
getallurls                              \
getsploit                               \
gitleaks                                \
gobuster                                \
godoh                                   \
golang-github-binject-go-donut          \
goldeneye                               \
goofile                                 \
google-nexus-tools                      \
gophish                                 \
goshs                                   \
gospider                                \
gpart                                   \
gpp-decrypt                             \
graudit                                 \
h8mail                                  \
hak5-wifi-coconut                       \
hakrawler                               \
hamster-sidejack                        \
hashdeep                                \
hashid                                  \
hash-identifier                         \
hashrat                                 \
hb-honeypot                             \
hcxtools                                \
heartleech                              \
hekatomb                                \
horst                                   \
hostapd-mana                            \
hotpatch                                \
hping3                                  \
htshells                                \
httprint                                \
httprobe                                \
httpx-toolkit                           \
httrack                                 \
ident-user-enum                         \
ifenslave                               \
ike-scan                                \
impacket-scripts                        \
inetsim                                 \
inspy                                   \
instaloader                             \
intrace                                 \
iodine                                  \
ipv6toolkit                             \
irpas                                   \
ismtp                                   \
iw                                      \
joomscan                                \
jsp-file-browser                        \
knocker                                 \
koadic                                  \
kustomize                               \
lapsdumper                              \
laudanum                                \
lbd                                     \
libimage-exiftool-perl                  \
ligolo-ng                               \
linux-exploit-suggester                 \
macchanger                              \
maskprocessor                           \
masscan                                 \
massdns                                 \
mdbtools                                \
mdk3                                    \
mdk4                                    \
medusa                                  \
merlin-agent                            \
merlin-server                           \
mimikatz                                \
minicom                                 \
miredo                                  \
mssqlpwner                              \
multiforcer                             \
multimac                                \
mxcheck                                 \
naabu                                   \
name-that-hash                          \
nasm                                    \
nbtscan                                 \
nbtscan                                 \
nbtscan-unixwiz                         \
ncat                                    \
ncrack                                  \
ncrack                                  \
ncurses-hexedit                         \
netcat-traditional                      \
netdiscover                             \
netdiscover                             \
netexec                                 \
netmask                                 \
netmask                                 \
netscanner                              \
netsed                                  \
netsniff-ng                             \
nextnet                                 \
nfs-common                              \
ngrep                                   \
nikto                                   \
nipper-ng                               \
nishang                                 \
nmap                                    \
nuclei                                  \
ohrwurm                                 \
onesixtyone                             \
onesixtyone                             \
o-saft                                  \
outguess                                \
owl                                     \
p0f                                     \
parsero                                 \
passdetective                           \
payloadsallthethings                    \
pdfid                                   \
pdf-parser                              \
pdf-parser                              \
peirates                                \
phishery                                \
photon                                  \
phpggc                                  \
phpsploit                               \
pipal                                   \
pipx                                    \
pixiewps                                \
pixiewps                                \
plocate                                 \
pnscan                                  \
pompem                                  \
portspoof                               \
princeprocessor                         \
proxify				                    \
proxify                                 \
proximoth                               \
proxychains4                            \
proxytunnel                             \
pskracker                               \
pspy                                    \
ptunnel                                 \
pwnat                                   \
pwncat                                  \
pyinstxtractor                          \
python3-ldapdomaindump                  \
python3-wsgidav                         \
python-is-python3                       \
qsslcaudit                              \
rake                                    \
raven                                   \
reaver                                  \
rebind                                  \
reconspider                             \
redsocks                                \
reglookup                               \
rephrase                                \
responder                               \
rfkill                                  \
ridenum                                 \
rling                                   \
robotstxt                               \
ropper                                  \
routersploit                            \
rsmangler                               \
rtpbreak                                \
rtpflood                                \
rtpinsertsound                          \
rtpmixsound                             \
ruby-pedump                             \
s3scanner                               \
sakis3g                                 \
samba					                \
samdump2                                \
sara                                    \
sbd                                     \
scalpel                                 \
screen                                  \
scrounge-ntfs                           \
sctpscan                                \
sendemail                               \
sentrypeer                              \
sfuzz                                   \
sharpshooter                            \
shed                                    \
shellfire                               \
sickle-tool                             \
sidguesser                              \
siege						            \
sigma-cli                               \
silenttrinity                           \
siparmyknife		                    \
sipp                                    \
sipsak                                  \
skipfish                                \
skipfish                                \
sleuthkit                               \
slowhttptest                            \
smbmap                                  \
sn0int                                  \
snmp                                    \
snmpcheck                               \
snmpd                                   \
snmpenum                                \
snowdrop                                \
socat                                   \
spike 				                    \
spike                                   \
sploitscan                              \
spooftooph                              \
sqlmap                                  \
sqlmc                                   \
sqlninja                                \
sqlsus                                  \
ssldump                                 \
sslh                                    \
sslscan                                 \
sslsniff                                \
sslsplit                                \
sslstrip                                \
sslyze                                  \
statsprocessor                          \
stegcracker                             \
steghide                                \
stegsnow                                \
stunnel4                                \
subfinder                               \
subjack                                 \
sublist3r                               \
swaks                                   \
syft                                    \
t50                                     \
tcpdump                                 \
tcpflow                                 \
tcpick                                  \
tcpreplay                               \
telnet 				                    \
testdisk                                \
testssl.sh                              \
tftp-hpa                                \
thc-ipv6                                \
thc-pptp-bruter                         \
thc-ssl-dos                             \
tlssled                                 \
tnscmd10g                               \
traceroute                              \
truecrack                               \
trufflehog                              \
tundeep                                 \
udptunnel                               \
unblob                                  \
undbx                                   \
unhide                                  \
unhide.rb                               \
uniscan                                 \
unix-privesc-check                      \
unrar                                   \
upx-ucl                                 \
vboot-kernel-utils                      \
vboot-utils  		                    \
villain                                 \
vlan                                    \
voiphopper                              \
vpnc                                    \
wafw00f                                 \
wapiti                                  \
waybackpy                               \
wce                                     \
wce                                     \
webacoo                                 \
web-cache-vulnerability-scanner         \
webshells                               \
weevely                                 \
wfuzz                                   \
wgetpaste                               \
whatmask                                \
whatweb                                 \
whois                                   \
wifi-honey					            \
wig                                     \
wig-ng                                  \
windows-binaries                        \
winexe                                  \
witnessme                               \
wmi-client                              \
wordlistraider                          \
wpa-sycophant                           \
wpscan                                  \
xmount                                  \
xsrfprobe                               \
xxd                                     \
yara                                    \
yersinia                                \
zonedb					\				
recon-ng 


# large size

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


# go installations
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

go install -v github.com/s0md3v/smap/cmd/smap@latest
go install github.com/lc/gau/v2/cmd/gau@latest
go install github.com/tomnomnom/unfurl@latest
go install github.com/gwen001/github-subdomains@latest
go install github.com/tomnomnom/meg@latest

GO111MODULE=on go install -v github.com/lc/subjs@latest
go install -v github.com/musana/fuzzuli@latest





pipx install bbot
git clone https://github.com/nahamsec/bbht.
cd bbht
chmod +x install.sh
./install.sh
git clone https://github.com/nahamsec/recon_profile.git
git clone https://github.com/juice-shop/juice-shop.git --depth 1
#git clone https://github.com/Dewalt-arch/pimpmykali.git
#cd pimpmykali
#sudo ./pimpmykali.sh
#sudo apt install seclists
git clone https://github.com/R-s0n/ars0n-framework.git
git clone https://github.com/R-s0n/Bug_Bounty_Notes.git

 


