# docker-etlegacy
Docker image for running a ET: Legacy 64-bit dedicated server.

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
**2021-03-01:** ET: Legacy 2.77 is here!
* Bump ET: Legacy to version 2.77
* Change website for .pk3 download to official Splash Damage website.
* Added a Docker Volume for /etlegacy
* Moved the launch options from entrypoint to CMD so the user can override them with their own launch options.

**2021-01-17:** Second release.

This is a breaking release that might break your server. Backup all config files before updating and then make a clean install.
* More clean way of starting the server without need for entrypoint.sh.

**2020-09-25:** First release.

## Usage
The documentation for ET: Legacy isn't great but they have a [wiki](https://github.com/etlegacy/etlegacy/wiki) on their [GitHub](https://github.com/etlegacy/etlegacy) and [documentation for some variables](https://github.com/etlegacy/etlegacy/wiki/Set-up-Features#server).

### etl_server.cfg.sample
Download etl_server.cfg and mapvotecycle.cfg to ./data and make the changes that you want before starting the container.

### docker run
```
docker run --name etlegacy \
-p 27960:27960/udp \
-v ./data/etl_server.cfg:/etlegacy/etmain/etl_server.cfg \
sebdanielsson/etlegacy
```

### docker-compose.yml
```
version: '3.8'
services:
  etlegacy:
    image: sebdanielsson/etlegacy
    container_name: etlegacy
    ports:
      - '27960:27960/udp'
    volumes:
      - './data/etl_server.cfg:/etlegacy/etmain/etl_server.cfg'
      - './data/mapvotecycle.cfg:/etlegacy/etmain/mapvotecycle.cfg'
    restart: unless-stopped
```

## To-Do
* Make a 32-bit option
* Feel free to suggest improvements.

## Donate
<a href="https://buymeacoffee.com/danielsson" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/white_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## Contribute
All contributions are appreciated.

## License
MIT
