choise=$(echo "shutdown
reboot
logout
" | wofi --dmenu -c ~/.config/wofi/power_menu/config -s ~/.config/wofi/power_menu/style.css)
test "$choise" == "shutdown" && shutdown now
test "$choise" = "reboot" && reboot
test "$choise" = "logout" && hyprctl dispatch exit
