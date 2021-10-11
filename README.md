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
      - ./geph4-exit:/config
    ports:
      - 8814:8814
      - 8814:8814/udp
    ulimits:
      nofile: 65536
    restart: unless-stopped
```

[Sample config file](https://github.com/docker-geph/geph4-exit/blob/main/root/default/geph4-exit.toml) for docker deployment, which will be copied to location specified in `volumes` if missing. `geph4-exit.key` will also be created if missing.

You can find your public key in `docker logs geph4-exit`.

# Credit
[LinuxServer.io](https://github.com/linuxserver) for the docker image template. This package is modeled after [docker-ddclient](https://github.com/linuxserver/docker-ddclient).
