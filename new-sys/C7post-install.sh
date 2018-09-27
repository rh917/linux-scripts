#!/usr/bin/sh
# CentOS 7 

#disable SELinux if enabled
setenforce 0	#temporarily disable until reboot
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux        #modify SElinux file to not load on reboot

#stop IPtables firewall
systemctl stop firewalld
systemctl disable firewalld

# install common packages
yum install -y epel-release
yum check-update
yum install -y nano wget perl curl nfs-utils bind-utils python python-devel open-vm-tools ntp git unzip zip
yum update -y

#start ntpd
systemctl start ntpd
systemctl enable ntpd



#Alert complete and restart 30 sec
echo -e "System will reboot now"
shutdown -r now