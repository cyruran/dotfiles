redshift &
xfsettingsd &
xfce4-power-manager &
pavucontrol &
(
    systemctl --user start emacs
    emacsclient -c
) &
xmodmap -e 'clear lock'
setxkbmap -option caps:none
/home/cyril/misc/x11/layout_per_window &
exec i3
