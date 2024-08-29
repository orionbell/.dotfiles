wallpaper=~/Pictures/Wallpapers/$(ls ~/Pictures/Wallpapers | shuf -n 1)
swww img ${wallpaper} --transition-fps 60 --transition-type random --transition-duration 3
