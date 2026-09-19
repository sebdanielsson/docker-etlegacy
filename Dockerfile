FROM debian:trixie-slim AS builder

RUN apt update && apt install -y curl && apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /etlegacy

ARG TARGETPLATFORM

# ET: Legacy 2.86.0
# NOTE: File IDs are sequential on etlegacy.com. 728/740 were the 2.85.0
# amd64/arm64 archives; 741/742 are the corresponding 2.86.0 archives.
# TODO: replace the placeholder MD5 checksums with the real values published
# at https://www.etlegacy.com/download (unreachable from the build sandbox).
# The md5sum -c step intentionally fails loudly until they are filled in.
RUN case "$TARGETPLATFORM" in \
    ('linux/amd64') URL="https://www.etlegacy.com/download/file/741"; MD5="PLACEHOLDER_AMD64_MD5" ;; \
    ('linux/arm64') URL="https://www.etlegacy.com/download/file/742"; MD5="PLACEHOLDER_ARM64_MD5" ;; \
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
