#!/bin/bash

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