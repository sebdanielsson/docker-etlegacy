#!/bin/bash

ls -l
ls -l /etlegacy-v2.76-x86_64
ls -l /etlegacy

# move server files into shared folder that the host can access
if [ -d "etlegacy-v2.76-x86_64" ]; then
  mv  -v /etlegacy-v2.76-x86_64/* /etlegacy/
  echo "Renaming mv etlegacy-v2.76-x86_64 etlegacy"
fi

# launch server

ls -l
ls -l /etlegacy-v2.76-x86_64
ls -l /etlegacy

chmod 700 ./etlded_bot.sh
echo "Trying to exec etlded_bot.sh, let's see where it breaks"

ls -l
ls -l /etlegacy-v2.76-x86_64
ls -l /etlegacy

etlded_bot.sh
