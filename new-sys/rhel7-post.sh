#!/usr/bin/sh
# RHEL 7 post install script

#disable SELinux
setenforce 0	#temporarily disable
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux        #modify SElinux file

#stop IPtables firewall
service firewalld stop
chkconfig firewalld off

# install common packages
yum install -y epel-release
yum check-update
yum install -y nano wget perl curl nfs-utils bind-utils python python-devel open-vm-tools ntp libstdc++.i686 unzip zip
yum update -y

#start ntpd
service start ntpd
chkconfig ntpd


#Alert complete and restart 30 sec
echo -e "System will reboot now"
shutdown -r now