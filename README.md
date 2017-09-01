# alpine-docker-netshare

Install script to add docker-volume-netshare nfs plugin version 3 to default boot of alpine linux.
Can also be used to add other plugins to boot (EFS, CIFS, NFSv4).

## result after reboot
```shell
PID root       0:00 /usr/bin/docker-volume-netshare nfs -v 3
```

## build with

* [Alpine Linux](https://alpinelinux.org/) - Alpine Linux OpenRC
* [docker-volume-netshare](https://github.com/ContainX/docker-volume-netshare) - external filesystem plugin for docker volumes

## tips

* rc-update del docker-volume-nfs //remove script from default