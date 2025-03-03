neofetch
# system aliases
alias reconftw="docker run -it -v ~/recon/:'/reconftw/Recon/' six2dez/reconftw:main -d $1 -r"
alias xfce4-terminal='xfce4-terminal --maximize'
alias i='sudo apt install'
alias u='sudo apt update && sudo apt upgrade'
alias x='exit'
alias cimg='convert -resize 50% -quality 85'
alias ytd='~/atheer/config/scripts/ytd.sh'
alias myip='curl ifconfig.me'
alias dk='sudo docker'
alias paste='xsel -b -o'
# convience aliases
mkpattern(){
mkdir -p $PATTERNS/$1
echo $2 | fabric -p create_pattern_advanced >> $PATTERNS/$1/system.md 
}
asklinux(){
printf "%s" "$1" | fabric -p help_linux
}
snippet(){
printf "%s" "$1" | fabric -p create_snippet
}
# security
asksec(){
printf "%s" "$1" | fabric -p ask_sec
}
askdev(){
printf "%s" "$1" | fabric -p ask_dev
}
isproxy(){
curl -x $1:$2 -I https://www.google.com
}
# games
mrc(){
cnee --record --mouse --keyboard -o ~/atheer/games/cnee/$1.xns -sk q -v
#-t 0.5
}

mrp(){
cnee -rep -f ~/atheer/games/cnee/$1.xns -ns -sk q -v
}

#mrr(){
#    for i in $(seq 1 $2); do
#
#       cnee -rep -f ~/atheer/games/cnee/$1.xns -ns -sk q
#       if [ $? -ne 0 ]; then
#          echo "Replay stopped by user. Exiting loop."
#          break
#        fi
#    done
#}


if [ -f ~/.env ]; then
    export $(cat ~/.env | xargs)
fi
export GOROOT=/usr/bin/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GOROOT=/usr/bin/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
