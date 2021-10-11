# docker-geph4-exit
Automated [build](https://github.com/docker-geph/geph4-exit/releases) and [docker image](https://hub.docker.com/repository/docker/dockergeph/geph4-exit) for [Geph4-exit](https://github.com/geph-official/geph4-exit)

# Usage
docker-compose:
```yml
services:
  geph4-exit:
    image: dockergeph/geph4-exit
    container_name: geph4-exit
    environment:
      - TZ=Etc/UTC
    volumes:
      - ./geph4-exit:/config/geph4-exit
    ports:
      - 8814:8814
    ulimits:
      nofile: 65536
    restart: unless-stopped
```

# Credit
[LinuxServer.io](https://github.com/linuxserver) for the docker image template. This package is modeled after [docker-ddclient](https://github.com/linuxserver/docker-ddclient).
