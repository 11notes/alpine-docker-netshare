#!/bin/sh

# install  nfs-utils
apk update
apk add nfs-utils \
        ca-certificates \
        wget
rc-update add nfsmount
rc-update add netmount
update-ca-certificates

# download docker-volume-netshare plugin and add to system startup
wget -O /usr/bin/docker-volume-netshare https://github.com/ContainX/docker-volume-netshare/releases/download/v0.34/docker-volume-netshare_0.34_linux_amd64-bin \
    && chmod +x /usr/bin/docker-volume-netshare

# create OpenRC upstart script, set nfs version 3, and add to default
# could be changed for CIFS, EFS, etc
echo -e "#!/sbin/openrc-run\n\
name=\"docker-volume-netshare nfs\"\n\
command=\"/usr/bin/docker-volume-netshare\"\n\
command_args=\"nfs -v 3\"
pidfile=\"/var/run/docker-volume-netshare-nfs.pid\"\n\
command_background=\"yes\"\n\
depend(){\n\
    need net\n\
    need nfsmount\n\
    need netmount\n\
}\n" \
    > /etc/init.d/docker-volume-nfs \
    && chmod +x /etc/init.d/docker-volume-nfs \
    && rc-update add docker-volume-nfs