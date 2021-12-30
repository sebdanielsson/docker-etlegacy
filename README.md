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

## Changelog
**2021-12-23:** ET: Legacy 2.79.0 is here!
* Bump ET: Legacy to version 2.79.0.
* Significantly reduced image size.

**2021-11-03:** ET: Legacy 2.78.1 is here!
* Bump ET: Legacy to version 2.78.1.
* Update docker-compose.yaml to follow the latest compose spec.

**2021-10-01:** ET: Legacy 2.78.0 is here!
* Bump ET: Legacy to version 2.78.0.
* Upgrade base image to Debian Bullseye.
* New installation method.

**2021-03-18:** ET: Legacy 2.77.1 is here!
* Bump ET: Legacy to version 2.77.1

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
Documentation for some of the commands are available at the projects [wiki](https://github.com/etlegacy/etlegacy/wiki/Set-up-Features#server).

### Sample config and pak-files
1. Download three pak-files that's required to run ET: Legacy. Put them in ./data/etmain. If standing in the same folder as your compose.yaml, run this one-liner: `curl -O --output-dir ./data/etmain "https://mirror.etlegacy.com/etmain/pak[0-2].pk3"`
2. Download etl_server.cfg and mapvotecycle.cfg to ./data/etmain and make the changes that you want before starting the container.

### docker run
```
docker run --name etlegacy \
-p 27960:27960/udp \
-v ./data/etmain:/etlegacy/etmain \
sebdanielsson/etlegacy:latest
```

### compose.yaml
```
services:
  etlegacy:
    container_name: etlegacy
    image: sebdanielsson/etlegacy:latest
    command: +set fs_game legacy +set fs_homepath etmain +set g_protect 1 +exec etl_server.cfg
    ports:
      - "27960:27960/udp"
    volumes:
      - ./data/etmain:/etlegacy/etmain
    restart: unless-stopped
```

## Nitmod
The following instruction assumes that you're deploying with docker compose.

1. Download Nitmod
```
mkdir data/nitmod
```
```
curl http://etmods.net/downloads/nitmod_2.3.4-b4.zip -o nitmod_2.3.4-b4.zip && unzip -d data/nitmod nitmod_2.3.4-b4.zip nitmod_2.3.4_b4.pk3 qagame.mp.x86_64.so && rm nitmod_2.3.4-b4.zip
```
2. Add the following bind mount under volumes: in your `compose.yml` to make your nitmod directory accessible to the container.
```
- ./data/nitmod:/etlegacy/nitmod
```
3. Replace the launch options in your `compose.yaml`.
```
command: +set fs_game nitmod +set fs_homepath /etlegacy +set g_protect 1 +exec nitmod.cfg
```
4. Add nitmod.cfg ***(Required)***, levels.db ***(Recommended)***, commands.db, votes.db
Some documentation can be found on these websites:
* [N!tmod - Installation (Unofficial)](https://nitmod-docusaurus.vercel.app/docs/installation)
* [ETMods.net - Installation Tutorial (Official)](http://etmods.net/nitmod_install.php)

## Donate
<a href="https://buymeacoffee.com/danielsson" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/white_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## Contribute
All contributions are appreciated.

## License
MIT
