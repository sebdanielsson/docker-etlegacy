FROM debian:bullseye-slim AS builder

RUN apt update && apt install -y curl && apt clean && rm -rf /var/lib/apt/lists/*

RUN curl https://www.etlegacy.com/download/file/407 | tar xvz; mv etlegacy-*/ /etlegacy;

FROM debian:bullseye-slim

LABEL maintainer "Sebastian Danielsson <sebastian.danielsson@protonmail.com>"

EXPOSE 27960/UDP

RUN groupadd -r etlegacy && useradd -g etlegacy etlegacy

COPY --chown=etlegacy --from=builder /etlegacy /etlegacy

USER etlegacy

WORKDIR /etlegacy

ENTRYPOINT ["./etlded"]
CMD ["+set", "fs_game", "legacy", "+set", "fs_homepath", "etmain", "+set", "g_protect", "1", "+exec", "etl_server.cfg"]
