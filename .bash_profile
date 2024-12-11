neofetch
if [ -f ~/.env ]; then
  source ~/.env
fi
# vars
# system aliases
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
mkdir -p $1 
echo $2 | fabric -p create_pattern_advanced >> $1/system.md 
}
helplinux(){
printf "%s" "$1" | fabric -p help_linux
}
snippet(){
printf "%s" "$1" | fabric -p create_snippet
}
# security
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
