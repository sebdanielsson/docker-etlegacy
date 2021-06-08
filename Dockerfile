FROM debian:stable-slim

LABEL maintainer "Sebastian Danielsson <sebastian.danielsson@protonmail.com>"

RUN apt update && apt install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://www.etlegacy.com/download/file/254 | tar xvz; mv etlegacy-*/ /etlegacy; \
    curl -O --output-dir etlegacy/etmain "https://mirror.etlegacy.com/etmain/pak[0-2].pk3"

RUN useradd -Ms /bin/bash etlegacy; chown -R etlegacy:etlegacy /etlegacy

EXPOSE 27960/UDP

VOLUME ["/etlegacy"]

WORKDIR /etlegacy

USER etlegacy

ENTRYPOINT ["./etlded"]
CMD ["+set", "fs_game", "legacy", "+set", "fs_homepath", "etmain", "+set", "g_protect", "1", "+exec", "etl_server.cfg"]
