# based on latest stable Debian
FROM debian:stable-slim

# maintainer
LABEL maintainer "Sebastian Danielsson <sebastian.danielsson@protonmail.com>"

# create volumes to load config files from host and save downloaded files to host
VOLUME ["/etlegacy/etmain"]

# open the server port
EXPOSE 27960/udp

# install required tools and clear apt cache
RUN apt update && apt install -y \
  p7zip-full \
  curl \
 && rm -rf /var/lib/apt/lists/*

 # install ET: Legacy and assets
RUN curl https://www.etlegacy.com/download/file/121 | tar xvz; mv etlegacy-v2.76-x86_64 etlegacy && \
    curl -o temp.exe http://trackbase.eu/files//et/full/WolfET_2_60b_custom.exe; 7z e temp.exe -oetlegacy/etmain etmain/pak*.pk3; rm temp.exe
    
# do some basic config
RUN echo "set sv_allowDownload \"1\"" >> etlegacy/etmain/etl_server.cfg  && \
    echo "set rconpassword \"etlegacy\"" >> etlegacy/etmain/etl_server.cfg

# start the server
WORKDIR /etlegacy
ENTRYPOINT ./etlded_bot.sh
