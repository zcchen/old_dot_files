# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=65535

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias l=ls
#PS1='[`date +%R:%S` \u@\h \W]\$ '
#PS1='\[\033[01;32m\]`date +%R:%S` \u@\h\[\033[01;34m\] \w\$\[\033[00m\] '
PS1='\[\033[01;32m\]\t \u \[\033[01;34m\]\w\$\[\033[00m\] '
export PATH="$PATH:$HOME/.bash:"
export PATH="$PATH:/opt/dassault-systemes/draftsight/bin/:"
#export PATH="$PATH:/opt/android-sdk/tools:/opt/java6/bin:"

export EDITOR=vim
#export USE_CCACHE=1

alias v='vim'
alias vimrc='vim ~/.vimrc'
alias ctags='ctags --c++-kinds=+p --fields=+iaS --extra=+q'

alias pacman='sudo pacman'
#alias wine="env LANG=en_US.UTF-8 wine"
alias xterm='xterm -class 256color'
alias w3m='w3m -cookie -graph -F -num'

#set bash work like vi.
#set -o vi
alias info='info --vi-keys'
alias lynx='lynx -vikeys'

alias aurploader='aurploader -nk'

# set bash completion
source /usr/share/git/completion/git-completion.bash        #git
source /usr/share/doc/pkgfile/command-not-found.bash        #pkgfile
complete -cf {pacman,packer}
complete -cf {git,sudo,proxychains,systemctl}

#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus

##change login name, especially for that close-source program
#alias skype='xhost +local: && sudo -u skype /usr/bin/skype'
#alias winetricks='xhost +local: && sudo -u skype /usr/bin/winetricks'
#alias wine='xhost +local: && sudo -u skype /usr/bin/wine'

alias clockUpdate='sudo ntpd -qg && sudo hwclock -w'
alias pwdcd="pwd | xsel -ib"
alias cdpwd="cd $(xsel -ob)"
