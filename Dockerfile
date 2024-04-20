FROM debian:bookworm-slim AS builder

RUN apt update && apt install -y curl && apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /etlegacy

ARG TARGETPLATFORM

RUN case "$TARGETPLATFORM" in \
    ('linux/amd64') URL="https://www.etlegacy.com/download/file/590" ;; \
    ('linux/arm64') URL="https://www.etlegacy.com/workflow-files/dl/ad6c5cfce623699c9106617678559d3c7b5025d5/lnxarm64/etlegacy-v2.82.0-71-gad6c5cf-aarch64.tar.gz" ;; \
    (*) echo "Unsupported platform $TARGETPLATFORM" && exit 1 ;; \
    esac && \
    curl $URL | tar xz -i --strip-components=1 && if [ -f etlded.* ]; then mv etlded.* etlded; fi

FROM debian:bookworm-slim

LABEL maintainer "Sebastian Danielsson <sebastian.danielsson@proton.me>"

RUN groupadd -r etlegacy && useradd -g etlegacy etlegacy

COPY --from=builder --chown=etlegacy:etlegacy /etlegacy /etlegacy

WORKDIR /etlegacy

EXPOSE 27960/UDP

USER etlegacy

ENTRYPOINT ["./etlded"]
CMD ["+set", "fs_game", "legacy", "+set", "fs_homepath", "etmain", "+set", "g_protect", "1", "+exec", "etl_server.cfg"]
