DIR=$HOME/.config/wallpapers/ontime
currenttime=$(date +%H:%M)
if [[ "$currenttime" > "20:00" ]]; 
then
    IMG=$DIR/night.webp
elif [[ "$currenttime" > "04:00" ]]; 
then 
    IMG=$DIR/morning.webp
elif [[ "$currenttime" > "11:00" ]]; 
then
    IMG=$DIR/noon.webp
elif [[ "$currenttime" > "16:00" ]]; 
then
    IMG=$DIR/afternoon.webp
fi
echo $IMG
swww query || swww-daemon

swww img ${IMG} --transition-fps 30 --transition-type random --transition-duration 2
