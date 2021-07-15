#!/bin/bash
# make-able-modded-minecraft.sh

echo "make-able-modded-minecraft.sh running"

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

sudo apt remove -y default-jre
sudo apt remove -y default-jre-headless
sudo apt remove -y openjdk-11-jre
sudo apt remove -y openjdk-11-jre-headless
sudo apt remove -y minecraft-launcher

flatpak remove com.mojang.Minecraft -y --noninteractive

sudo snap install minecraft-launcher-ot

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

sudo apt install -y openjdk-8-jdk
sudo apt install -y openjdk-8-jdk-headless
sudo apt install -y openjdk-8-jre
sudo apt install -y openjdk-8-jre-headless
sudo apt install -y openjdk-8-jre-zero
sudo apt install -y openjdk-8-jre
sudo apt install -y openjdk-8-jre-headless
sudo apt install -y openjdk-8-jre-zero

sudo dpkg --configure -a && sudo apt-get -f install && sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y && sudo dpkg --configure -a && sudo apt-get -f install

echo "make-able-modded-minecraft.sh finished running, you should be fine now, fuckin mojang."

