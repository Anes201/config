export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

#########################################
# Load environment variables if ~/.env exists
if [ -f ~/.env ]; then
    export $(cat ~/.env | xargs)
fi

export PATTERNS=~/.config/fabric/patterns
export PAYLOADS="$HOME/recon/payloads"

# system aliases
alias zshconfig="nano ~/.zshrc && source ~/.zshrc"
alias zshrc='nano ~/.zshrc'
alias reconftw="docker run -it -v ~/recon/:'/reconftw/Recon/' six2dez/reconftw:main -d \$1 -r"
alias xfce4-terminal='xfce4-terminal --maximize'
alias i='sudo apt install'
alias u='sudo apt update && sudo apt upgrade'
alias x='exit'
alias cimg='convert -resize 50% -quality 85'
alias myip='curl ifconfig.me'
alias dk='sudo docker'
alias paste='xsel -b -o'
alias copy='xsel -b -i'
alias clipboard='xclip -o -b'
alias cat='batcat'
# BUG BOUNTY
alias payloads="cd $PAYLOADS"
# fabric aliases
mkpattern(){
    mkdir -p $PATTERNS/$1
    echo $2 | fabric -p create_pattern_advanced >> $PATTERNS/$1/system.md 
}
choosePattern(){
echo $(fabric -l) | fabric -p choose_pattern "$1"
}
tr(){
  trans :fr $1
}
askcmd(){
    printf "%s" "$1" | fabric -p ask_cmd
}
askfast(){
printf "%s" "$1" | fabric -p ask_fast
}

# misc
gitpush() {
git add .
git commit -m "push all"
git push origin main
}
puml() {
  docker run -d -p 8080:8080 plantuml/plantuml-server:jetty
  firefox localhost:8080
}
# security
asksec(){
    printf "%s" "$1" | fabric -p ask_sec
}
askdev(){
    printf "%s" "$1" | fabric -p ask_dev
}
isproxy(){
    curl -x \$1:\$2 -I https://www.google.com
}

# other
mrc(){
    cnee --record --mouse --keyboard -o ~/atheer/games/cnee/$1.xns -sk q -v
}

mrp(){
    cnee -rep -f ~/atheer/games/cnee/$1.xns -ns -sk q -v
}

#----- AWS -------

s3ls(){
aws s3 ls s3://$1
}

s3cp(){
aws s3 cp $2 s3://$1 
}

#---- Content discovery ----
thewadl(){ #this grabs endpoints from a application.wadl and puts them in yahooapi.txt
curl -s $1 | grep path | sed -n "s/.*resource path=\"\(.*\)\".*/\1/p" | tee -a ~/tools/dirsearch/db/yahooapi.txt
}

#----- recon -----
crtndstry(){
./tools/crtndstry/crtndstry $1
}

am(){ #runs amass passively and saves to json
amass enum --passive -d $1 -json $1.json
jq .name $1.json | sed "s/\"//g"| httprobe -c 60 | tee -a $1-domains.txt
}

certprobe(){ #runs httprobe on all the hosts from certspotter
curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a ./all.txt
}

mscan(){ #runs masscan
sudo masscan -p4443,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,4000,8888,5432,15672,9999,161,4044,7077,4040,9000,8089,443,744
}

certspotter(){ 
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} #h/t Michiel Prins

crtsh(){
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF'
}

certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1  | nmap -T5 -Pn -sS -i - -$
} #h/t Jobert Abma

ipinfo(){
curl http://ipinfo.io/$1
}


#------ Tools ------
dirsearch(){ runs dirsearch and takes host and extension as arguments
python3 ~/recon/tools/dirsearch/dirsearch.py -u $1 -e $2 -t 50 -b 
}

# sqlmap(){python ~/recon/tools/sqlmap*/sqlmap.py -u $1 }

ncx(){
nc -l -n -vv -p $1 -k
}

crtshdirsearch(){ #gets all domains from crtsh, runs httprobe and then dir bruteforcers
curl -s https://crt.sh/?q\=%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe -c 50
}

# Optional, you can enable some additional Zsh features for a better experience
# Enable autocompletion
autoload -Uz compinit
compinit

# Enable syntax highlighting (if installed)
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#vnstat -i wlp2s0 -d
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:/snap/bin
export PATH=$PATH:/usr/games
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Created by newuser for 5.9

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ZSH_THEME="duellj"
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode disabled  # disable automatic updates
HIST_STAMPS="mm/dd/yyyy"
plugins=(git docker web-search common-aliases history fzf httpie sudo zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


eval "$(zoxide init zsh)"


# Added by LM Studio CLI (lms)
export PATH="$PATH:~/.lmstudio/bin"
