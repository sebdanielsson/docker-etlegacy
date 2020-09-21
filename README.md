# docker-etlegacy
Docker image for running a ET: Legacy dedicated server.

## Changelog
-

## Usage
- Default rcon password is etlegacy.

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
-

## Contribute
All contributions are appreciated

## License
MIT
