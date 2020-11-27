echo "To begin;"
echo "If asked, please enter your sudo password to allow the script to work;"
sudo echo "Asking for sudo complete. Starting..."
sudo apt install -y wget
sudo apt install -y curl
cd /tmp
wget https://gitlab.com/Novimatrem/personal-autosetup-linux-ubuntu/-/raw/master/personal-autosetup-linux-ubuntu-script-run.sh
bash /tmp/personal-autosetup-linux-ubuntu-script-run.sh
