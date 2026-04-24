#!/bin/bash
#
# sudo sed -i -e 's/kernel-open$/kernel/g' /etc/nvidia/kernel.conf
# echo "options nvidia-drm modeset=1 fbdev=1" | sudo tee /etc/modprobe.d/nvidia-modeset.conf
# echo "options nvidia NVreg_EnableGpuFirmware=0" | sudo tee -a /etc/modprobe.d/nvidia-modeset.conf
# sudo chmod 644 /etc/modprobe.d/nvidia-modeset.conf
# sudo akmods --rebuild
# sudo dracut -f
# reboot

sudo apt install -y lsb-release
## Ubuntu version (number)
system="`lsb_release -rs`"


########################## Programs ##################################

## Add repositories
echo -e "Adding repositories..."
sudo add-apt-repository -y ppa:papirus/papirus
sudo add-apt-repository -y ppa:flatpak/stable
sudo add-apt-repository -y ppa:kisak/kisak-mesa
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository -y ppa:atareao/telegram
sudo add-apt-repository -y ppa:graphics-drivers/ppa
# sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo add-apt-repository -y multiverse
sudo add-apt-repository -y universe


# $(lsb_release -cs)
# cd /etc/apt/sources.list.d
# sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com `sudo apt update 2>&1 | grep -o '[0-9A-Z]\{16\}$' | xargs`
sudo timedatectl set-local-rtc 1


## Update repositories
echo -e "Updating repositories..."
sudo apt update
sudo dpkg --add-architecture amd64
sudo dpkg --add-architecture i386
sudo apt update
sudo apt upgrade -y
sudo apt install --fix-broken -y
sudo apt autoclean -y
sudo apt autoremove --purge

# curl -fsSL https://tailscale.com/install.sh | sh


## Programs to be installed with apt
## System
sudo apt install -y ffmpeg net-tools ufw software-properties-common \
	apt-transport-https sassc openssh-client cpu-x dpkg gpg make \
	cmake build-essential g++ gnupg clang dkms ca-certificates \
	lsb-release bash-completion fonts-firacode ppa-purge pass \
	xz-utils gcc-multilib pkg-config gdebi gdebi-core ninja-build \
	dconf-cli # or polkitd:i386  pkexec:i386  polkitd  pkexec

## Libs
sudo apt install -y libssl-dev libcurl4-gnutls-dev libexpat1-dev \
	libinih-dev libdbus-1-dev libsystemd-dev

## CLI
sudo apt install -y git git-gui nano curl wget hwinfo neofetch

## Apps
sudo apt install -y flatpak krita vlc qbittorrent \
	sweeper gparted unzip p7zip-rar p7zip-full \
	rar unrar zip telegram grub-customizer

sudo apt install -y --fix-broken --install-recommends

## For outline
sudo apt install -y libfuse2t64

## For Gnome
sudo apt install -y gnome-browser-connector gnome-disk-utility \
	gnome-software-plugin-flatpak gnome-shell-extension-manager \
	gnome-tweaks chrome-gnome-shell	dconf-editor gnome-shell-extensions

# Just in case
echo "Downloading package keys and .deb files..."
cd ~
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B05498B7


## Get script directory
# paste your path to post-install-ubuntu folder
SCRIPT_DIR=/mnt/d/CRYPTO/post-install-ubuntu
sudo apt install -y $SCRIPT_DIR/debs/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
sudo apt install -y $SCRIPT_DIR/debs/ocs-url_3.1.0-0ubuntu1_amd64.deb
sudo apt install -y $SCRIPT_DIR/debs/figma-linux_0.11.5_linux_amd64.deb
sudo apt install -y $SCRIPT_DIR/debs/Hiddify-Debian-x64.deb
sudo apt install -y $SCRIPT_DIR/debs/anilibria_2.2.25_amd64.deb
sudo apt install --fix-broken -y
sudo apt install -y -f
sudo systemctl daemon-reload

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo systemctl daemon-reload
sudo dpkg --configure -a
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# Install Flatpak packages
# flatpak run be.alexandervanhee.gradia --screenshot=INTERACTIVE
flatpak install -y flathub \
  com.github.tchx84.Flatseal org.onlyoffice.desktopeditors \
  be.alexandervanhee.gradia io.missioncenter.MissionCenter \
  com.github.wwmm.easyeffects org.kde.krita me.iepure.devtoolbox \
  com.microsoft.Edge com.mattermost.Desktop io.github.kolunmi.Bazaar \
  io.dbeaver.DBeaverCommunity net.lutris.Lutris \
  net.davidotek.pupgui2 com.usebottles.bottles \
  com.github.Matoking.protontricks ru.linux_gaming.PortProton \
  com.visualstudio.code


  # com.github.sdv43.whaler org.pgadmin.pgadmin4 com.redis.RedisInsight
  # com.github.d4nj1.tlpui com.discordapp.Discord \
  # io.github.mimbrero.WhatsAppDesktop com.obsproject.Studio \
  # com.getpostman.Postman com.playonlinux.PlayOnLinux4 \
  # org.audacityteam.Audacity

# Flatpak permissions
sudo flatpak override --filesystem=/usr/lib/x86_64-linux-gnu/GL \
  --filesystem=host --share=network --socket=wayland \
  --system-talk-name=org.freedesktop.NetworkManager \
  --system-talk-name=org.freedesktop.resolve1 \
  --talk-name=org.freedesktop.Notifications

# Group management for Flatpak and networking
sudo groupadd -f network
sudo groupadd -f flatpak
sudo usermod -aG network,sudo,flatpak $(whoami)
groups $(whoami)


# Options for shell in vscode
mkdir -p $HOME/.local/share/trusted.gpg.d
xdg-mime default code.desktop text/plain
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
code --locate-shell-integration-path bash


# Install VirtualBox
sudo apt install -y virtualbox
# sudo newgrp vboxusers
sudo usermod -aG vboxusers $(whoami)
sudo adduser $(whoami) vboxusers
sudo apt install -y virtualbox-dkms cpu-checker


## Remove junk and update
echo -e "Updating, upgrading and cleaning system..."
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y


echo
echo "############################################"
echo -e "System and Programs - Done"
echo "############################################"


# $SCRIPT_DIR/install_theme.sh

cd /lib/firmware
sudo wget https://github.com/beagleboard/mirror-linux-firmware/blob/2f411c10e4570d03426d3cb095471aa1120114ab/iwlwifi-so-a0-gf-a0-89.ucode
sudo modprobe -r iwlwifi
sudo modprobe iwlwifi
sudo dmesg | grep iwlwifi
cd -


# Install Java
sudo apt update && sudo apt install -y openjdk-17-jdk

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
echo "alias lzd='lazydocker'" >> ~/.bashrc
source ~/.bashrc

echo "############################################"
echo -e "Changes will be applied after restarting the computer"

echo -e "Done! Changes will be applied after reboot. Reboot now? (y/n)"
read -r RESTART
if [[ $RESTART == "y" || $RESTART == "Y" ]]; then
    sudo reboot now
else
    echo "Done! Changes will be applied after reboot"
fi
