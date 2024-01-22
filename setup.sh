#!/bin/bash

sudo apt update
sudo apt install -y docker.io

cd ~; mkdir Palworld; git clone https://github.com/thijsvanloef/palworld-server-docker.git
cd ~/palworld-server-docker
sudo docker run -d \
    --name palworld-server \
    -p 8211:8211/udp \
    -p 27015:27015/udp \
    -v ~/Palworld:/palworld/ \
    -e PLAYERS=16 \
    -e PORT=8211 \
    -e PUID=1000 \
    -e PGID=1000 \
    -e COMMUNITY=false \
    --restart unless-stopped \
    thijsvanloef/palworld-server-docker
