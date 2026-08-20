FROM debian:trixie-slim AS builder

RUN apt update && apt install -y curl && apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /etlegacy

ARG TARGETPLATFORM

RUN case "$TARGETPLATFORM" in \
    ('linux/amd64') URL="https://www.etlegacy.com/download/file/728"; MD5="9e02a9aa3654877d3e58339e071128cf" ;; \
    ('linux/arm64') URL="https://www.etlegacy.com/download/file/740"; MD5="50be387df453d472e4d2c71d4c8365e5" ;; \
    (*) echo "Unsupported platform $TARGETPLATFORM" && exit 1 ;; \
    esac && \
    curl -fsSL "$URL" -o etlegacy.tar.gz && \
    echo "$MD5  etlegacy.tar.gz" | md5sum -c - && \
    tar xzf etlegacy.tar.gz -i --strip-components=1 && \
    rm etlegacy.tar.gz && \
    if [ -f etlded.* ]; then mv etlded.* etlded; fi

FROM debian:trixie-slim

LABEL maintainer="Sebastian Danielsson <sebastian.danielsson@proton.me>"

RUN groupadd -r etlegacy && useradd -g etlegacy etlegacy

COPY --from=builder --chown=etlegacy:etlegacy /etlegacy /etlegacy

WORKDIR /etlegacy

EXPOSE 27960/udp

USER etlegacy

ENTRYPOINT ["./etlded"]
CMD ["+set", "fs_game", "legacy", "+set", "fs_homepath", "etmain", "+set", "g_protect", "1", "+exec", "etl_server.cfg"]
