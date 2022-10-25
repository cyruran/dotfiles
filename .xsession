redshift -l 59:30 &
xfsettingsd &
xfce4-power-manager &
pavucontrol &
(
    systemctl --user start emacs
    emacsclient -c
) &
xmodmap -e 'clear lock'
setxkbmap -option caps:none
exec i3
