
# Adding keys
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
rm microsoft.gpg
# wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub -O- | sudo apt-key add -

# Adding repos
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" >> /etc/apt/sources.list.d/vscode.list'
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" >> /etc/apt/sources.list.d/microsoft-edge.list'
# sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt update
sudo apt install -y microsoft-edge-stable code
sudo apt install -y --fix-broken --install-recommends


# wget https://github.com/jgraph/drawio-desktop/releases/download/v24.5.3/drawio-amd64-24.5.3.deb
# wget https://github.com/hiddify/hiddify-next/releases/download/v2.5.7/Hiddify-Debian-x64.deb
# $SCRIPT_DIR/debs/ocs-url_3.1.0-0ubuntu1_amd64.deb
# wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher_2.2.0-travis995.0f91801.bionic_amd64.deb
# wget https://download.anydesk.com/linux/anydesk_6.1.1-1_amd64.deb


# Install Tenderly CLI
# curl -sSL https://raw.githubusercontent.com/Tenderly/tenderly-cli/master/scripts/install-linux.sh | sudo sh
# tenderly login --authentication-method access-key --access-key FWrGeuFEOTmwzUdD4Glm1BRl1ov5hNLJ --force


# Install Hysteria
# echo 'Installing Hysteria...'
# bash <(curl -fsSL https://get.hy2.sh/)
# wget -q https://github.com/HyNetwork/hysteria/releases/download/v1.3.0/hysteria-linux-amd64
# sudo mv hysteria-linux-amd64 /usr/local/bin/hysteria
# sudo chmod +x /usr/local/bin/hysteria
# TODO [FATA] [file:./config.json] [error:open ./config.json: no such file or directory] Failed to read configuration


# curl -L https://foundry.paradigm.xyz | bash
# . ~/.bashrc
# foundryup


## Install GitKraken
# wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
# sudo apt install ./gitkraken-amd64.deb
# rm gitkraken-amd64.deb


# # install qemu
# sudo apt update
# sudo apt install -y \
#   cpu-checker bridge-utils libvirt-daemon-system libvirt-clients \
#   virt-manager virtinst qemu-kvm
# sudo adduser $USER libvirt
# sudo adduser $USER kvm
# sudo systemctl enable --now libvirtd
# sudo systemctl start libvirtd
# sudo systemctl status libvirtd
# sudo usermod -aG kvm $USER
# sudo usermod -aG libvirt $USER
# virt-manager

# # dotNet
# sudo apt update && \
#   sudo apt install -y \
#   dotnet-sdk-8.0 aspnetcore-runtime-8.0 dotnet-runtime-8.0 zlib1g ca-certificates \
#   libc6 libgcc-s1 libicu74 liblttng-ust1 libssl3 libstdc++6 libunwind8

# cd ~
# wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
# chmod +x ./dotnet-install.sh
# ./dotnet-install.sh --channel 6.0
# ./dotnet-install.sh --channel 7.0
# ./dotnet-install.sh --version latest
# rm ./dotnet-install.sh


## For fingerprint
# sudo add-apt-repository ppa:3v1n0/libfprint
# sudo apt update
# sudo apt full-upgrade -y
# sudo apt install -y fprintd libpam-fprintd libfprint-2-dev \
# 	libfido2-1 libpam-u2f
# sudo apt install --reinstall libssl3 \
# 	libcrypto++-dev libcrypto++8 \
# 	openssl libssl-dev
# pip install py-webauthn

# sudo sed -i '1s/^/auth sufficient pam_fprintd.so\n/' /etc/pam.d/common-auth
# sudo tee -a /etc/sddm.conf.d/kde_settings.conf <<< \
# "
# [Authentication]
# EnableFingerprintAuth=true"
