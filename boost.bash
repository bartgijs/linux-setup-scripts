#!/bin/bash

# Make sure the script is ran as root
if [ "$EUID" -ne 0 ]
  then echo "Script needs run as root, exiting..."
  exit
fi

# Boost install
BOOST_DOWNLOAD_FOLDER=/home/$SUDO_USER/sources/boost_1_77_0
mkdir $BOOST_DOWNLOAD_FOLDER -p
cd $BOOST_DOWNLOAD_FOLDER
wget -O boost_1_77_0.tar.gz https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.gz
tar -xzf boost_1_77_0.tar.gz
mv boost_1_77_0/* .
rmdir boost_1_77_0
rm boost_1_77_0.tar.gz
bash bootstrap.sh
sudo ./b2 -j16 toolset=gcc --build-type=complete link=shared runtime-link=shared threading=multi,single variant=debug,release address-model=64 --layout=tagged --without-python --cxxflags="-std=c++17" install stage 2>&1 | tee build.log
sudo ldconfig