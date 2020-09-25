#!/bin/sh

# move server files into shared folder that the host can access
if [ -d "/etlegacy-v2.76-x86_64" ];
  then
    cp -n /etlegacy-v2.76-x86_64/etmain/* /etlegacy/etmain/
    rm -R /etlegacy-v2.76-x86_64/etmain/
    mv /etlegacy-v2.76-x86_64/* /etlegacy/
    rm -R /etlegacy-v2.76-x86_64
fi

# launch server
./etlded +set g_protect 1 +set omnibot_enable 1 +set omnibot_path "./legacy/omni-bot" +exec etl_server.cfg 
