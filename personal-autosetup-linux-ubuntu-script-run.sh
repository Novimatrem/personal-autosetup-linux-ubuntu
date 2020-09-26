#!/bin/bash

# Novimatrem personal-autosetup-linux Ubuntu
echo "Novimatrem personal-autosetup-linux Ubuntu"

echo "Checking if the correct user..."

if [[ $EUID -eq 0 ]]; then
    echo "Do not run this as the root user, or with sudo. Ending!"
    exit 1
fi

echo "Not root, good, continuing!"

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

lvnote "Started executing Novimatrem personal-autosetup-linux Ubuntu at around $(date)"

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

# blender open data benchmark
cd /opt
wget https://opendata.blender.org/cdn/BlenderBenchmark2.0/launcher/benchmark-launcher-2.0.5-linux.tar.gz
# />

# gajim
ins gajim-antispam
ins gajim-plugininstaller
ins gajim-appindicatorintegration
ins gajim-omemo
ins gajim-urlimagepreview
sudo apt remove -y gajim

# i migrated to gajim's flatpaks
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
ins assaultcube

ins ffmpeg
arepo ppa:obsproject/obs-studio
ins obs-studio

lvnote "Follow your blog post to fully permanently disable mouse acceleration."

gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/Langelinie_All%C3%A9_by_SirPecanGum.jpg

gsettings set org.gnome.desktop.wm.preferences button-layout ‘close,close,minimize,maximize:’

gsettings set org.gnome.desktop.app-folders folder-children ['']

sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-ac 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-display-battery 0
gsettings set org.gnome.desktop.session idle-delay 0
sudo gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
sudo gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
sudo setterm -blank 0 -powersave off -powerdown 0
sudo xset s 0 0
sudo xset dpms 0 0
sudo xset dpms force off
sudo xset s off
xset -dpms
xset s noblank
xset s off
gsettings set org.gnome.settings-daemon.plugins.power active false
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
setterm -blank 0
setterm -blank 0 -powerdown 0
sudo chown $USER /etc/issue
sudo echo -ne "\033[9;0]" >> /etc/issue

sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner"

lvnote "Remember to set up your GNOME Shell Extensions if you're using GNOME 3, or plan to be."

ins libimage-exiftool-perl
ins flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# brackets editor (for markdown)
cd /opt
wget https://github.com/adobe/brackets/releases/download/release-1.14.1/Brackets.Release.1.14.1.64-bit.deb
insdeb ./Brackets.Release.1.14.1.64-bit.deb
# />

flatpak install flathub io.brackets.Brackets -y --noninteractive

cd /opt
tar -xvzf benchmark-launcher-2.0.5-linux.tar.gz -C /opt
tar -xvzf Geekbench-5.2.3-Linux.tar.gz -C /opt

sudo chmod +x /opt/benchmark-launcher-2.0.5-linux/benchmark-launcher
sudo chmod +x /opt/Geekbench-5.2.3-Linux/geekbench5
sudo chmod +x /opt/Geekbench-5.2.3-Linux/geekbench_x86_64

cd /opt
sudo chmod +x /opt/Unigine_Heaven-4.0.run
/opt/Unigine_Heaven-4.0.run

# vbox
cd /opt
ins virtualbox
# />

# gog (minigalaxy)
cd /opt
wget https://github.com/sharkwouter/minigalaxy/releases/download/0.9.4/minigalaxy_0.9.4_all.deb
insdeb ./minigalaxy_0.9.4_all.deb
# />

# itch.io app
cd /opt
wget https://nuts.itch.zone/download/linux
sudo chmod +x ./linux
./linux
sudo rm -rf ./linux
# />

ins eog

# ensure window buttons left more (and for budgie)
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/ShellShowsAppMenu': <0>, 'Gtk/DecorationLayout': <'close,minimize,maximize,menu:'>}"
gsettings set com.solus-project.budgie-wm button-layout 'close,maximize,minimize,appmenu:'
gsettings set org.gnome.desktop.wm.preferences button-layout close,minimize,maximize:minimize,maximize,close

lvnote "Install this alias https://gitlab.com/Novimatrem/dvorak-qwerty-switch-aliases"

lvnote "Install this alarm clock https://gitlab.com/Novimatrem/alarm-clock so you can wake up"

ins filezilla

sudo apt install -y sddm

sudo systemctl enable sddm

echo ""
echo "Installing ALL the IceWM..."
echo ""

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

sudo apt install -y build-essential

sudo apt install -y git


sudo mkdir /opt
cd /opt/
sudo chown $USER /opt
sudo chown $USER /opt/*

wget https://ice-wm.org/scripts/os-depends.sh

sudo bash -x ./os-depends.sh

git clone https://github.com/bbidulock/icewm

cd icewm

./autogen.sh

./configure --enable-gdk-pixbuf --prefix=/usr

make

sudo make install

sudo apt install -y icewm-experimental

sudo apt install -y icewm icewm

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

echo ""
echo "Installed ALL the IceWM."
echo ""

sudo apt install -y libnotify-bin
sudo apt install -y xfce4-notifyd

echo ""
echo "Installing ALL the Xfce..."
echo ""

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

sudo apt install -y lightdm
sudo systemctl enable lightdm
sudo dpkg-reconfigure lightdm

sudo apt install -y xubuntu-desktop
sudo apt install -y xfce4
sudo apt install -y xubuntu-default-settings
sudo apt install -y xfce4-goodies

sudo apt-get install -y xfce4*

sudo apt install -y tasksel

sudo tasksel install xubuntu-desktop
sudo tasksel install xubuntu-core

sudo apt-get install -y xubuntu*

sudo apt install -y xfdesktop4

sudo apt install -y xfwm4

sudo apt install -y zenity

sudo apt install -y libnotify-bin

sudo apt install -y xfce4-notifyd

sudo apt install -y xfce4-appfinder

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

echo ""
echo "Installed ALL the Xfce."
echo ""

lvnote "Be sure to find a nice IceWM theme online, and to edit its files to change the window buttons to the left, and to make the fonts smaller, as you install it. (if you plan to use IceWM)"

ins freedoom

ins snap
ins snapd

sudo snap install snapd

sudo snap install hello-world

sudo snap install xonotic

sudo snap install nethack

sudo snap install snap-store

sudo snap install supertux --edge

sudo snap install dolphin-emulator --edge

sudo snap install os-runes

sudo snap install minetest --beta

sudo snap install drawio

sudo snap install termdown --edge

sudo snap install protonmail-desktop-unofficial

sudo snap install ponysay

sudo snap install bucklespring

sudo snap install languagetool

sudo snap install ubports-installer

sudo snap install pngcrush --edge

sudo snap refresh

flatpak install flathub com.adobe.Flash-Player-Projector -y --noninteractive

flatpak install flathub org.gpodder.gpodder -y --noninteractive

flatpak install flathub io.freetubeapp.FreeTube -y --noninteractive

flatpak install flathub org.jitsi.jitsi-meet -y --noninteractive

flatpak install flathub org.robocode.Robocode -y --noninteractive

flatpak install flathub com.unity.UnityHub -y --noninteractive

flatpak install flathub com.gitlab.librebob.Athenaeum -y --noninteractive

flatpak install flathub io.mrarm.mcpelauncher -y --noninteractive

flatpak install flathub org.srb2.SRB2 -y --noninteractive

flatpak install flathub org.srb2.SRB2Kart -y --noninteractive

flatpak install flathub net.supertuxkart.SuperTuxKart -y --noninteractive

flatpak install flathub com.zandronum.Zandronum -y --noninteractive

# flatpak gajim and plugins
flatpak install flathub org.gajim.Gajim -y --noninteractive
flatpak install flathub org.gajim.Gajim.Plugin.appindicator -y --noninteractive
flatpak install flathub org.gajim.Gajim.Plugin.url_image_preview -y --noninteractive
flatpak install flathub org.gajim.Gajim.Plugin.omemo -y --noninteractive
# ^ flatpak gajim and plugins /> 

flatpak install flathub im.bernard.Nostalgia -y --noninteractive

flatpak install flathub org.remmina.Remmina -y --noninteractive

flatpak install flathub com.rafaelmardojai.Blanket -y --noninteractive

flatpak install flathub ca._0ldsk00l.Nestopia -y --noninteractive

flatpak update

# appimaged
cd /opt
wget "https://github.com/AppImage/appimaged/releases/download/continuous/appimaged-x86_64.AppImage"
chmod a+x appimaged-x86_64.AppImage
./appimaged-x86_64.AppImage --install

wget https://github.com/AppImage/appimaged/releases/download/continuous/appimaged_1-alpha-git8e248f5.travis223_amd64.deb
sudo gdebi -n appimaged_1-alpha-git8e248f5.travis223_amd64.deb
systemctl --user add-wants default.target appimaged
systemctl --user start appimaged
# ^ appimaged />

# appimaged appimageupdate
wget https://github.com/AppImage/AppImageUpdate/releases/download/continuous/AppImageUpdate-x86_64.AppImage
sudo mv "/opt/AppImageUpdate-x86_64.AppImage" /usr/local/bin/AppImageUpdate
sudo chmod a+x /usr/local/bin/AppImageUpdate
# ^ appimaged appimageupdate />

# appimaged appimageupdatetool
wget https://github.com/AppImage/AppImageUpdate/releases/download/continuous/appimageupdatetool-x86_64.AppImage
sudo mv "/opt/appimageupdatetool-x86_64.AppImage" /usr/local/bin/appimageupdatetool
sudo chmod a+x /usr/local/bin/appimageupdatetool
# ^ appimaged appimageupdatetool />

sudo apt install -y nethack-console moon-buggy ninvaders nsnake pacman4console bsdgames typespeed vitetris frotz
sudo apt install -y emacs --no-install-recommends && sudo apt install -y emacs-nox

# teamviewer
cd /opt
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo gdebi -n /opt/teamviewer_amd64.deb
# /teamviewer

echo ""
echo "Installing ALL the GNOME..."
echo ""

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

sudo apt install -y gnome-shell

sudo apt install -y ubuntu-gnome-desktop

sudo apt install -y tasksel

sudo tasksel install desktop gnome-desktop

sudo apt install -y gnome-session 

sudo apt install -y gdm3

sudo tasksel install ubuntu-desktop

sudo apt install -y gnome

sudo apt install -y gnome-core

sudo apt install -y gnome-software

sudo apt install -y gnome-software-plugin-flatpak

sudo apt install -y gnome-software-plugin-snap

sudo apt install -y vanilla-gnome-desktop

sudo apt install -y vanilla-gnome-default-settings

sudo apt install -y ubuntu-gnome-default-settings

sudo apt install -y ubuntu-session

sudo apt install -y yaru-theme-gnome-shell

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install


echo ""
echo "Installed ALL the GNOME."
echo ""

sudo apt-get install -y ubuntu-wallpapers-* edgy-wallpapers feisty-wallpapers gutsy-wallpapers

cd /opt
wget https://github.com/cheesecakeufo/komorebi/releases/download/v2.1/komorebi-2.1-64-bit.deb
sudo gdebi -n /opt/komorebi-2.1-64-bit.deb

sudo apt-get install build-essential linux-headers-$(uname -r)
ins virtualbox-guest-x11

# yaru/communitheme
sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

sudo snap refresh
sudo flatpak update

sudo apt install -y yaru-theme-gnome-shell
sudo apt install -y yaru-theme-gtk
sudo apt install -y yaru-theme-icon
sudo apt install -y yaru-theme-sound
sudo apt install -y communitheme-snap-session

sudo snap install communitheme

flatpak install flathub org.gtk.Gtk3theme.Communitheme -y --noninteractive
flatpak install flathub org.gtk.Gtk3theme.Yaru -y --noninteractive
flatpak install flathub org.gtk.Gtk3theme.Yaru-light -y --noninteractive
flatpak install flathub org.gtk.Gtk3theme.Yaru-dark -y --noninteractive

gsettings set org.gnome.shell.extensions.user-theme name "Yaru-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-dark"
gsettings set org.gnome.desktop.wm.preferences theme "Yaru-dark"
gsettings set org.gnome.shell.extensions.user-theme name "Yaru-dark"

lvnote "If the Yaru/Communitheme isn't working, you may need to install this: https://www.xfce-look.org/p/1251531/ "

lvnote "Be sure to install AND ENABLE the User Themes GNOME Shell Extension: https://extensions.gnome.org/extension/19/user-themes/ "

sudo snap refresh
sudo flatpak update

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install
# ^ yaru/communitheme />

uppy

sudo update-alternatives --all
sudo update-alternatives --config editor

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

sudo echo -e "\n Novimatrem personal-autosetup-linux installed by $(whoami) at $(date) - do not remove this file, it's for safety to not accidentally re-apply changes. \n" >> /opt/novisetup.done

lvnote "Finished executing Novimatrem personal-autosetup-linux Ubuntu at around $(date)"

gtfo

# />