#!/bin/bash

# Make sure the script is ran as root
if [ "$EUID" -ne 0 ]
  then echo "Script needs to run as root, exiting..."
  exit
fi

sudo bash ./boost.bash
sudo bash ./wx_widgets.bash
