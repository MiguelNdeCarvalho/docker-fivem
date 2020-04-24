#!/bin/sh

echo "Creating default"
mkdir /fivem

echo "Download required files and move it"
cd /tmp
mkdir server
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/${FIVEM_VER}/fx.tar.xz
tar -xf fx.tar.xz -C /server
git clone https://github.com/citizenfx/cfx-server-data.git server-data
mv server /fivem
mv server-data /fivem
rm /tmp/*
mv /roots/server.cfg /fivem/server-data/