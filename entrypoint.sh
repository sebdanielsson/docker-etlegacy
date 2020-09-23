#!/bin/bash

# move server files into shared folder that the host can access
mv etlegacy-v2.76-x86_64 etlegacy

# launch server
cd etlegacy
./etlded_bot.sh
