#!/bin/bash

# Novimatrem personal-autosetup-linux Ubuntu
echo "Novimatrem personal-autosetup-linux Ubuntu"

echo "Checking if already ran before..."

if [ -f /opt/novisetup.done ]; then
    echo "Ran before, ending! This script should only be ran once per fresh install!" && exit
fi

if [ ! -f /opt/novisetup.done ]; then
    echo "Not ran before, continuing!"
fi

echo "Ranwhen sanity check complete."

# the following line makes this entire script work
shopt -s expand_aliases

setxkbmap dvorak
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+dvorak')]"

sudo dpkg --add-architecture i386 

# aliases

# don't actually use these aliases anywhere else,
# they're dumb and for script tidy only

alias ins="sudo apt install -y $1"

alias insdeb="sudo gdebi -n $1"

alias insNIR="sudo apt install -y $1 --no-install-recommends"

alias uppy="sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo dpkg --configure -a && sudo apt-get -f install"

alias arepo="sudo add-apt-repository -y $1"

alias swake="cd /opt && wget https://gitlab.com/Novimatrem/personal-autosetup-linux-ubuntu/-/raw/master/wobblemouse-wakeup.sh && nohup bash wobblemouse-wakeup.sh &"

alias gtfo="zenity --warning --text 'Process complete. Shutting down in 1 minute. REFER TO NOTES.TXT IN HOME AFTER REBOOT.' & shutdown -h +1"

alias sey='zenity --warning --text $1'

alias lvnote='echo -e "\n$1\n" >> /home/$(whoami)/NOTES.txt'

alias brcappend='echo -e "\n$1\n" >> /home/$(whoami)/.bashrc'

alias asksudo='echo "If asked, please enter your sudo password to allow the script to work;" && sudo echo "Asking for sudo complete."'
# />

# init

asksudo

# mark the script to not run again, after this time
# as it is designed to be ran once only
sudo mkdir /opt
cd /opt
sudo chown $USER /opt
sudo touch /opt/novisetup.done
sudo chown $USER /opt/novisetup.done

uppy

# script deps (but they are also really useful)
ins xdotool
ins zenity
ins wget
# />

sey "You will be unable to use the mouse until this process is complete. Press OK to start."

touch /home/$(whoami)/NOTES.txt

lvnote "Notes: (to-do, AKA things I am yet to automate)-"

swake

ins python-is-python3

ins caffeine

ins build-essential

# dvorak keyboard layout
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+dvorak')]"
sudo dpkg-reconfigure keyboard-configuration
brcappend "setxkbmap dvorak"
# />

ins gdebi
ins wget
ins curl

# power saving
ins tlp
sudo systemctl enable tlp
sudo systemctl start tlp
sudo tlp start

ins powertop

ins mbpfan
# />

insNIR gnome-tweaks

lvnote "Install noexif from https://gitlab.com/Novimatrem/noexif"

ins sox

# unicode and emoji
ins ttf-ancient-fonts
ins fonts-noto-color-emoji
ins fonts-recommended
# />

lvnote "Install yolo from https://gitlab.com/-/snippets/1996989"

# all archive support
ins unrar
ins zip
ins unzip
ins p7zip-full
ins p7zip-rar
ins rar
ins unace
ins sharutils
ins uudeview
ins mpack
ins arj
ins cabextract
ins file-roller
# />

ins xbindkeys

ins ffmpeg

# terminal games
ins nethack-console
ins moon-buggy
ins ninvaders
ins nsnake
ins pacman4console
ins bsdgames
ins typespeed
ins vitetris
ins frotz
insNIR emacs
ins emacs-nox
# />

lvnote "Install the MVPS HOSTS file with this script https://gitlab.com/-/snippets/1992890"

insNIR xfce4-appfinder

ins stacer
ins bleachbit

ins vlc

# lutris deps and lutris
ins unrar
ins zip
ins unzip
ins p7zip-full
ins p7zip-rar
ins rar
ins unace
ins sharutils
ins uudeview
ins mpack
ins arj
ins cabextract
ins file-roller
ins debhelper-compat
ins dh-sequence-python3
ins python3
ins python3-yaml
ins python3-setuptools
ins python3-requests
ins python3-pil
ins python3-gi
ins gir1.2-gtk-3.0
ins gir1.2-glib-2.0
ins gir1.2-gnomedesktop-3.0
ins gir1.2-webkit2-4.0
ins gir1.2-notify-0.7
ins libgirepository1.0-dev
ins python3-yaml
ins python3-requests
ins python3-pil
ins python3-gi
ins python3-setproctitle
ins python3-distro
ins gir1.2-gtk-3.0
ins gir1.2-gnomedesktop-3.0
ins gir1.2-webkit2-4.0
ins gir1.2-notify-0.7
ins psmisc
ins cabextract
ins unzip
ins p7zip
ins curl
ins fluid-soundfont-gs
ins x11-xserver-utils
ins mesa-utils
ins python3-evdev
ins gvfs-backends
ins libwine-development
ins winetricks
ins libc6-i386
ins lib32gcc1
ins gamemode
ins build-essential
ins libgnutls30:i386
ins libldap-2.4-2:i386
ins libgpg-error0:i386
ins libxml2:i386
ins libasound2-plugins:i386
ins libsdl2-2.0-0:i386
ins libfreetype6:i386
ins libdbus-1-3:i386
ins libsqlite3-0:i386
ins wine-development
ins wine64-development
ins playonlinux
arepo ppa:lutris-team/lutris
uppy
ins lutris
uppy
# />

# wire - wireapp
cd /opt
wget https://github.com/wireapp/wire-desktop/releases/download/linux%2F3.19.2928/Wire-3.19.2928_amd64.deb
insdeb ./Wire-3.19.2928_amd64.deb
# />

# pts
cd /opt
wget http://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_9.8.0_all.deb
insdeb ./phoronix-test-suite_9.8.0_all.deb
# />

# geekbench
cd /opt
wget http://cdn.geekbench.com/Geekbench-5.2.3-Linux.tar.gz
# />

# heaven
cd /opt
wget https://assets.unigine.com/d/Unigine_Heaven-4.0.run
sudo chmod +x ./Unigine_Heaven-4.0.run
# />

# vscodium
cd /opt
wget https://github.com/VSCodium/vscodium/releases/download/1.48.0/codium_1.48.0-1597345748_amd64.deb
insdeb ./codium_1.48.0-1597345748_amd64.deb
# />

# gajim
ins gajim
ins gajim-antispam
ins gajim-plugininstaller
ins gajim-appindicatorintegration
ins gajim-omemo
ins gajim-urlimagepreview
# />

lvnote "Do all the things listed here (Dvorak): https://gitlab.com/-/snippets/1997412"

ins chromium-browser

ins armagetronad
ins feedreader
ins gimp
ins pavucontrol
ins guvcview
ins cheese
ins audacity
ins simplescreenrecorder
ins openshot
insNIR kdenlive
ins cool-retro-term
ins stterm
ins psensor
ins gnome-system-monitor
ins gnome-backgrounds
ins ubuntu-wallpapers
sudo apt-get install -y ubuntu-wallpapers*
ins steam
ins nautilus-dropbox
ins minetest
ins mypaint
ins KolourPaint
ins calibre
ins atril
ins gedit
ins git
ins gnome-weather
ins localepurge
ins pavucontrol
ins transmission
ins vlc
ins dolphin-emulator
ins abiword
ins baobab
ins ncdu
ins bleachbit
ins blueman
ins brackets
ins brasero
ins bucklespring
ins crispy-doom
ins freedoom1
ins gnome-disks
ins gparted
ins htop
ins gnome-terminal
ins gnumeric
ins handbrake
ins jstest-gtk
ins libreoffice
ins neofetch
ins net-tools
ins nethogs
ins peek
ins pencil2d
ins playonlinux
ins psensor
ins pylint
ins qjoypad
ins tmux
ins torbrowser-launcher
ins transmission

lvnote "Follow your blog post to fully permanently disable mouse acceleration."

uppy

sudo update-alternatives --all
sudo update-alternatives --config editor

sudo echo -e "\n Novimatrem personal-autosetup-linux installed by $(whoami) at $(date) - do not remove this file, it's for safety to not accidentally re-apply changes. \n" >> /opt/novisetup.done

gtfo

# />