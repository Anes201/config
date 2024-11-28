# global variables                                         │
#CODING_DIR=~/dev/                                         │myip(){
#PROJECTS_REPO=$CODING_DIR/myProjects                      │curl ifconfig.me
#NOTES_DIR='~/dev/myProjects/Misc'     

#alias howto='python $CODING_DIR/quickies/mixtral_assistant.py '
#alias fcd='cd $(find ~/dev -type d | fzf)'<alias fcd='cd $(find ~/dev -type d | fzf)' 
# sysfetch script
# system aliases

u(){
sudo apt update && sudo apt upgrade
}
x(){
exit
}

# convience aliases
todo(){
cat ~/.todo
}
cimg(){
convert -resize 50% -quality 85
}

ytd(){
~/atheer/config/scripts/ytd.sh
}

# security
myip(){
curl ifconfig.me
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
