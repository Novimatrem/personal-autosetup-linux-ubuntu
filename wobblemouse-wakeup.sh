# wobblemouse-wakeup.sh
sudo apt install -y xdotool
while sleep 1; do xdotool mousemove 300 300 && xdotool mousemove 330 330; done