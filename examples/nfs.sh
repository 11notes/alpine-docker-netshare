#!/bin/sh
docker volume create --name myNFSVolume \
        -d nfs -o share=NFS_SERVER/PATH/TO/DIRECTORY