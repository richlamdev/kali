#!/bin/bash
# 
# Basic setup script for Kali Linux VMware installation.
# Created from Kali Linux 2019.4 - Xubuntu

# Load default vimrc settings
cp .vimrc ..

# Install software
apt update
apt install pip ufw -y

# Disable IPv6
# Do not disable IPv6 for hackthebox.eu lab
#sed -e '/GRUB_CMDLINE_LINUX_DEFAULT=/ s/^#*/#/' -i_backup /etc/default/grub
#sed -e '/GRUB_CMDLINE_LINUX=/ s/^#*/#/' -i_backup /etc/default/grub
#sed -e '/GRUB_CMDLINE_LINUX_DEFAULT=/ a\GRUB_CMDLINE_LINUX_DEFAULT="quiet ipv6.disable=1"' -i_backup /etc/default/grub
#sed -e '/GRUB_CMDLINE_LINUX=/ a\GRUB_CMDLINE_LINUX="initrd=/install/initrd.gz ipv6.disable=1"' -i_backup /etc/default/grub
#update-grub2

# Configure SSH Server
sed -e '/AddressFamily/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sed -e '/AddressFamily/ a\AddressFamily\ inet' -i_backup /etc/ssh/sshd_config
sed -e '/X11Forwarding\ yes/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sed -e '/X11Forwarding\ yes/ a\X11Forwarding\ no' -i_backup /etc/ssh/sshd_config
sed -e '/PermitRootLogin\ prohibit-password/ s/^#*/#/' -i_backup /etc/ssh/sshd_config
sed -e '/PermitRootLogin\ prohibit-password/ a\PermitRootLogin no' -i_backup /etc/ssh/sshd_config

# Set SSH as only available service 
#ufw limit 22/tcp
# Default: no ports available
ufw enable

# Start OpenSSH Server
#systemctl enable ssh

# Setup OSCP tools
apt install html2text exiftool libxml2-utils wce
pip install pyftpdlib

mkdir /ftp

cp /usr/share/windows-binaries/*exe /ftp/.
cp /usr/share/unix-privesc-check/unix-privesc-check /ftp/.
cp /usr/share/windows-resources/wce/wce* /ftp/.


# Setup latest Firefox ESR default proxy to 127.0.0.1 port 8080
# For Burp Suite http(s) traffice interception

/usr/bin/firefox-esr -CreateProfile burpsuite
cp user.js ~/.mozilla/firefox/*.burpsuite/.

# run firefox with -ProfileManager and select burpsuite as default profile
# /usr/bin/firefox-esr -ProfileManager
