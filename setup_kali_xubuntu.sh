#!/bin/bash
 
# Basic setup script for Kali Linux VMware installation.
# Created for Kali Linux 2020.2a - Xubuntu

# Load default vimrc settings
cp .vimrc ..

# Install software
sudo apt update
sudo apt install jq ufw -y

# Disable IPv6
# Do not disable IPv6 for hackthebox.eu lab
#sed -e '/GRUB_CMDLINE_LINUX_DEFAULT=/ s/^#*/#/' -i_backup /etc/default/grub
#sed -e '/GRUB_CMDLINE_LINUX=/ s/^#*/#/' -i_backup /etc/default/grub
#sed -e '/GRUB_CMDLINE_LINUX_DEFAULT=/ a\GRUB_CMDLINE_LINUX_DEFAULT="quiet ipv6.disable=1"' -i_backup /etc/default/grub
#sed -e '/GRUB_CMDLINE_LINUX=/ a\GRUB_CMDLINE_LINUX="initrd=/install/initrd.gz ipv6.disable=1"' -i_backup /etc/default/grub
#update-grub2

# Configure SSH Server
sudo sed -e '/AddressFamily/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sudo sed -e '/AddressFamily/ a\AddressFamily\ inet' -i_backup /etc/ssh/sshd_config
sudo sed -e '/X11Forwarding\ yes/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sudo sed -e '/X11Forwarding\ yes/ a\X11Forwarding\ no' -i_backup /etc/ssh/sshd_config
sudo sed -e '/PermitRootLogin\ prohibit-password/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sudo sed -e '/PermitRootLogin\ prohibit-password/ a\PermitRootLogin no' -i_backup /etc/ssh/sshd_config

# Set SSH as only available service 
sudo ufw limit 22/tcp
sudo ufw enable

# Start OpenSSH Server
sudo systemctl enable ssh


# Setup latest Firefox ESR default proxy to 127.0.0.1 port 8080
# For Burp Suite http(s) traffice interception

/usr/bin/firefox-esr -CreateProfile burpsuite
cp user.js ~/.mozilla/firefox/*.burpsuite/.

# run firefox with -ProfileManager and select burpsuite as default profile
# /usr/bin/firefox-esr -ProfileManager
