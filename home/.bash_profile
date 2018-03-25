[ -f ~/.bashrc ] && . ~/.bashrc

[ $(echo $PATH | grep "\.:") ] || export PATH=$PATH:.:$HOME/bin
