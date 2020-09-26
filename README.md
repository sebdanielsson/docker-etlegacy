# docker-etlegacy
Docker image for running a ET: Legacy dedicated server.

[![GitHub](https://img.shields.io/badge/github-blue?style=flat&color=grey&logo=github)](https://github.com/SebDanielsson/docker-etlegacy)
[![GitHub stars](https://img.shields.io/github/stars/SebDanielsson/docker-etlegacy?style=flat&color=blue&logo=github)](https://github.com/SebDanielsson/docker-etlegacy/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/SebDanielsson/docker-etlegacy?style=flat&color=blue&logo=github)](https://github.com/SebDanielsson/docker-etlegacy/issues)
[![GitHub forks](https://img.shields.io/github/forks/SebDanielsson/docker-etlegacy?style=flat&color=blue&logo=github)](https://github.com/SebDanielsson/docker-etlegacy/network)
[![GitHub license](https://img.shields.io/github/license/SebDanielsson/docker-etlegacy?style=flat&color=blue&logo=github)](https://github.com/SebDanielsson/docker-etlegacy/blob/master/LICENSE)

[![Docker](https://img.shields.io/badge/docker-blue?style=flat&color=grey&logo=docker)](https://hub.docker.com/r/sebdanielsson/etlegacy)
![Docker Stars](https://img.shields.io/docker/stars/sebdanielsson/etlegacy?style=flat&color=blue&logo=docker&label=stars)
![Docker Pulls](https://img.shields.io/docker/pulls/sebdanielsson/etlegacy?style=flat&color=blue&logo=docker&label=pulls)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/sebdanielsson/etlegacy?style=flat&color=blue&logo=docker&label=build)

## Changelog
**2020-09-25:** First release.

## Usage
Server config can be changed in **etl_server.cfg** and **legacy.cfg** which is mounted to ./data after first run.
The documentation for ET: Legacy isn't great but they have a [wiki](https://github.com/etlegacy/etlegacy/wiki) on their [GitHub](https://github.com/etlegacy/etlegacy) and [documentation for some variables](https://github.com/etlegacy/etlegacy/wiki/Set-up-Features#server).

### docker run
```
docker run --name etlegacy \
-p 27960:27960/udp \
-v ./data:/etlegacy/etmain \
sebdanielsson/etlegacy
```

### docker-compose.yml
```
version: '3.3'
services:
    etlegacy:
        container_name: etlegacy
        image: sebdanielsson/etlegacy
        ports:
            - '27960:27960/udp'
        volumes:
            - './data:/etlegacy/etmain'
        restart: unless-stopped
```

## To-Do
Feel free to suggest improvements.

## Contribute
All contributions are appreciated.

## License
MIT
