FROM debian:stable-slim

LABEL maintainer "Sebastian Danielsson <sebastian.danielsson@protonmail.com>"

RUN apt update && apt install -y \
    p7zip-full \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p mkdir -p /etlegacy/homepath; \
    curl https://www.etlegacy.com/download/file/121 | tar xvz; mv etlegacy-*/ /etlegacy/etl_server; \
    curl -o temp.exe http://trackbase.eu/files/et/full/WolfET_2_60b_custom.exe; 7z e temp.exe -oetlegacy/etl_server/etmain etmain/pak*.pk3; rm temp.exe

RUN useradd -Ms /bin/bash etlegacy; chown -R etlegacy:etlegacy /etlegacy

VOLUME /etlegacy/etl_server/etmain

VOLUME /etlegacy/homepath

EXPOSE 27960/UDP

WORKDIR /etlegacy/etl_server

USER etlegacy

ENTRYPOINT ["./etlded", "+set","fs_homepath", "/etlegacy/homepath", "+set", "g_protect", "1", "+exec", "etl_server.cfg"]
