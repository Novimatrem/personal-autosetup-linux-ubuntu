# xfce416-upgrade-and-without-csd-test.sh

# xfce 4.16, and the war against CSD's (client side decorations)

# CSD's take up so much space and look very inconsistent compared to the rest of my apps
# i hate that xfce went that way, and ruined their desktop for it.

# if i can't find a way to truly disable CSD's, and restore the consistency Xfce 4.14 had,
#   then I will have to stick to Xfce 4.14 forever, no matter how old and deprecated it gets.

shopt -s expand_aliases

alias ins="sudo apt install -y $1"

alias uppy="sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo dpkg --configure -a && sudo apt-get -f install"

alias arepo="sudo add-apt-repository -y $1"

uppy

arepo ppa:xubuntu-dev/staging

uppy

arepo ppa:nilarimogard/webupd8
uppy
ins gtk3-nocsd

xfconf-query -c xsettings -p /Gtk/DialogsUseHeader -s false

echo "" >> /home/$(whoami)/.profile
echo "export GTK_CSD=0" >> /home/$(whoami)/.profile
echo "export LD_PRELOAD=/usr/lib/gtk3-nocsd/gtk3-nocsd.so" >> /home/$(whoami)/.profile
echo "" >> /home/$(whoami)/.profile

uppy

arepo ppa:xubuntu-dev/experimental

uppy

ins libxfce4ui-nocsd
ins libxfce4ui-nocsd-2-0

uppy

# /xfce 4.16, and the war against CSD's (client side decorations)

echo "Good luck."

# eof

