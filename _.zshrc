#PS1='[`date +%R:%S` \u@\h \W]\$ '
#PS1='\[\033[01;32m\]`date +%R:%S` \u@\h\[\033[01;34m\] \w\$\[\033[00m\] '

############ PATH Setting ###############
export PATH="$PATH:$HOME/.bash:"
#export PATH="$PATH:/opt/dassault-systemes/draftsight/bin/:"
#export PATH="$PATH:$HOME/.cabal/bin/:"
#export PATH="$PATH:/opt/android-sdk/tools:/opt/java6/bin:"
#export PATH="$PATH:/opt/android-sdk/platform-tools/"
############ PATH Setting ###############

############ alias Setting ###########
source ~/.bash/alias.sh
############ alias Setting ###########

# set completion
############# zsh completions ###########
fpath=(/usr/share/zsh/site-functions/   $fpath)
# Populate hostname completion.
zstyle -e ':completion:*:hosts' hosts 'reply=(
${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//,/ }
${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'
# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

# SSH/SCP/RSYNC
zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'
############# zsh completions ###########

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dst"

############# History setting #########
HIST_STAMPS="mm/dd/yyyy"
############# History setting #########
plugins=(archlinux autojump battery colored-man colorize cp git per-directory-history sudo systemd vi-mode virtualenwrapper z)
# vim-interaction)

# some basic stuffs
export EDITOR=vim
export GRAPHIC_EDITOR="gvim"

## check the window size after each command and, if necessary,
## update the values of LINES and COLUMNS.
##shopt -s checkwinsize


source $ZSH/oh-my-zsh.sh


###########################################
######## AFTER source oh-my-zsh.sh ########
###########################################

export KEYTIMEOUT=1
old_RPS1=${RPS1}
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"${old_RPS1}
    #if [[ $(fcitx-remote) -eq 2 ]]; then
        #fcitx-remote -c
        #FCITX_TIGGER=true
    #elif [[ $FCITX_TIGGER ]]; then
        #fcitx-remote -o
        #FCITX_TIGGER=false
    #fi
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

############# Command not found hook#############
source /usr/share/doc/pkgfile/command-not-found.zsh
############# Command not found hook#############
