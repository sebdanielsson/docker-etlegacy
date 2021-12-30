FROM debian:bullseye-slim

LABEL maintainer "Sebastian Danielsson <sebastian.danielsson@protonmail.com>"

EXPOSE 27960/UDP

RUN groupadd -r etlegacy && useradd -g etlegacy etlegacy

USER etlegacy

COPY --chown=etlegacy etlegacy-v2.79.0-x86_64 /etlegacy

WORKDIR /etlegacy

ENTRYPOINT ["./etlded"]
CMD ["+set", "fs_game", "legacy", "+set", "fs_homepath", "etmain", "+set", "g_protect", "1", "+exec", "etl_server.cfg"]
