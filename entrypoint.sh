#!/bin/bash

# move server files into shared folder that the host can access
if [ -d "etlegacy-v2.76-x86_64" ];
  then
    mv -v /etlegacy-v2.76-x86_64/* /etlegacy/
    rm -R /etlegacy-v2.76-x86_64
fi

# launch server
ls -l
./etlded_bot.sh
