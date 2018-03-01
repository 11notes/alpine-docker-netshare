#!/bin/sh
docker volume create --name myCIFSVolume \
        -d cifs --opt share=CIFS_SERVER/PATH/TO/DIRECTORY \
        --opt username=USERNAME --opt password=PASSWORD --opt domain=AD_DOMAIN \
        --opt security=ntlm --opt cifsopts=vers=2.1 \
        --opt uid=0 --opt gid=0 --opt fileMode=0755 --opt dirMode=0755