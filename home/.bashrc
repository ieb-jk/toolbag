# .bashrc

echo "Running .bashrc"

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

set -o vi

export EDITOR=vim MYVIMRC=$HOME/.vimc
#export Tok=

[ $(echo $PATH | grep "data\/bin") ] || export PATH=$PATH:.:~/data/bin

alias docClean="docker stop \$(docker ps -qa) && docker rm \$(docker ps -qa)"

