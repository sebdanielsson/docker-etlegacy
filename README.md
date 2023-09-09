# docker-etlegacy

Docker image for running a ET: Legacy 64-bit dedicated server.

[![GitHub](https://img.shields.io/badge/github-blue?style=flat&color=grey&logo=github)](https://github.com/SebDanielsson/docker-etlegacy)
[![GitHub stars](https://img.shields.io/github/stars/SebDanielsson/docker-etlegacy?style=flat&color=blue&logo=github)](https://github.com/SebDanielsson/docker-etlegacy/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/SebDanielsson/docker-etlegacy?style=flat&color=blue&logo=github)](https://github.com/SebDanielsson/docker-etlegacy/issues)
[![GitHub forks](https://img.shields.io/github/forks/SebDanielsson/docker-etlegacy?style=flat&color=blue&logo=github)](https://github.com/SebDanielsson/docker-etlegacy/network)
[![GitHub license](https://img.shields.io/github/license/SebDanielsson/docker-etlegacy?style=flat&color=blue&logo=github)](https://github.com/SebDanielsson/docker-etlegacy/blob/main/LICENSE)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/SebDanielsson/docker-etlegacy/release-build.yml?branch=main)

[![Docker](https://img.shields.io/badge/docker-blue?style=flat&color=grey&logo=docker)](https://hub.docker.com/r/sebdanielsson/etlegacy)
![Docker Stars](https://img.shields.io/docker/stars/sebdanielsson/etlegacy?style=flat&color=blue&logo=docker&label=stars)
![Docker Pulls](https://img.shields.io/docker/pulls/sebdanielsson/etlegacy?style=flat&color=blue&logo=docker&label=pulls)

[![buymeacoffee_img]][buymeacoffee_url]

[buymeacoffee_img]: https://img.shields.io/badge/donate-BuyMeACoffee-ffdd00?logo=buymeacoffee&style=flat
[buymeacoffee_url]: https://buymeacoffee.com/danielsson

## Changelog

A changelog is provided with each [release](https://github.com/SebDanielsson/docker-etlegacy/releases).

## Usage

Documentation for some of the commands are available at the projects [wiki](https://github.com/etlegacy/etlegacy/wiki/Set-up-Features#server).

### Sample config and pak-files

1. Clone the repo: `git clone https://github.com/sebdanielsson/docker-etlegacy.git`
2. Move to repo: `cd docker-etlegacy`
3. Download game data packs: `curl -O --output-dir ./data/etmain "https://mirror.etlegacy.com/etmain/pak[0-2].pk3"`
4. Configure `etl_server.cfg` and `mapvotecycle.cfg` in `./data/etmain` before starting the server.
5. Start the container.

### docker run

``` sh
docker run --name etlegacy \
-p 27960:27960/udp \
-v ./data/etmain:/etlegacy/etmain \
sebdanielsson/etlegacy:latest
```

### compose.yaml

``` Dockerfile
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

### 1. Download Nitmod

``` sh
mkdir data/nitmod
```

``` sh
curl http://etmods.net/downloads/nitmod_2.3.5.zip -o nitmod_2.3.5.zip && unzip -d data/nitmod nitmod_2.3.5.zip nitmod_2.3.5.pk3 qagame.mp.x86_64.so && rm nitmod_2.3.5.zip
```

### 2. Configure container

Add the following bind mount under volumes: in your `compose.yml` to make your nitmod directory accessible to the container.

``` sh
- ./data/nitmod:/etlegacy/nitmod
```

Replace the launch options in your `compose.yaml`.

``` sh
command: +set fs_game nitmod +set fs_homepath /etlegacy +set g_protect 1 +exec nitmod.cfg
```

### 3. Add Nitmod config

Add nitmod.cfg ***(Required)***, levels.db ***(Recommended)***, commands.db, votes.db

Some documentation can be found on these websites:

* [N!tmod - Installation (Unofficial)](https://sebbo.io/nitmod/docs/installation)
* [ETMods.net - Installation Tutorial (Official)](http://etmods.net/nitmod_install.php)

## Donate

<a href="https://buymeacoffee.com/danielsson" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/white_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;"></a>

## Contribute

All contributions are appreciated.

## License

MIT
