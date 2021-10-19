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

# WxWidgets install
WX_WIDGETS_FOLDER=/home/$SUDO_USER/sources/wxWidgets_3_1_5
mkdir $WX_WIDGETS_FOLDER -p
cd $WX_WIDGETS_FOLDER
sudo apt install libgtk-3-dev -y
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.5/wxWidgets-3.1.5.tar.bz2
tar -xvjf wxWidgets-3.1.5.tar.bz2
mv wxWidgets-3.1.5/* .
mv wxWidgets-3.1.5/.* .
rmdir wxWidgets-3.1.5
rm wxWidgets-3.1.5.tar.bz2
mkdir build-linux -p
cd build-linux
../configure --enable-debug --with-cxx=17
sudo make -j16 install 2>&1 | tee build.log
sudo ldconfig