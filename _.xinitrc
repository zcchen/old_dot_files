#exec awesome
#exec enlightenment_start
#exec i3 -V >> ~/.i3/i3log 2>&1
exec i3
#exec openbox

#pkill urxvtd
#urxvtd -q -o -f

#pkill syndaemon
#syndaemon -i 2 -dtk

setxkbmap -option ctrl:nocaps
#synclient TouchpadOff=$(synclient -l|grep -c 'TouchpadOff.*=.*0')

/usr/bin/start-pulseaudio-x11

#fcitx -d

#export GTK_IM_MODULE="fcitx"
#export QT_IM_MODULE="fcitx"
#export XMODIFIERS="@im=fcitx"

export GTK_IM_MODULE=fcitx
export XMODIFIERS='@im=fcitx'
export XIM="fcitx"
export XINPUT="xim"
export XIM_PROGRAM="fcitx -d"
export QT_IM_MODULE=fcitx

