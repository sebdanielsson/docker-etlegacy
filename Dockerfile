# based on latest stable Debian
FROM debian:stable-slim

# maintainer
LABEL maintainer "Sebastian Danielsson <sebastian.danielsson@protonmail.com>"

# install required tools and clear apt cache
RUN apt update && apt install -y \
  p7zip-full \
  curl \
 && rm -rf /var/lib/apt/lists/*

 # download etlegacy and assets
RUN curl https://www.etlegacy.com/download/file/121 | tar xvz; \
    curl -o temp.exe http://trackbase.eu/files//et/full/WolfET_2_60b_custom.exe; 7z e temp.exe -oetlegacy-v2.76-x86_64/etmain etmain/pak*.pk3; rm temp.exe

# do some basic config
RUN echo "set sv_allowDownload \"1\"" >> etlegacy-v2.76-x86_64/etmain/etl_server.cfg  && \
    echo "set rconpassword \"etlegacy\"" >> etlegacy-v2.76-x86_64/etmain/etl_server.cfg

# open the server port
EXPOSE 27960/udp

# start the server
COPY entrypoint.sh .
RUN chmod 700 /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
