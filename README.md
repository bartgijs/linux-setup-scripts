# linux-setup-scripts
Scripts to setup a new Linux installation. See this README to see what is installs, and what needs to be done beforehand.

## Prerequisites
 * Install the operating system (minimal installation is enough, internet is required)
 * Install git (Optional, as long as you get this repository local. The script does not install git)

## Usage
To use this program, simply run the script as a superuser from the terminal, like written in the code block below.
```bash
sudo ./ubuntu.bash
```
If the file is not runnable, run this command:
```bash
chmod +x ubuntu.bash
```

If you want to install Boost with wxwidgets, run the command below.
```bash
sudo ./boost_wxiwdgets.bash
```

## What the script does
 * Updates the system to the latest version
 * Downloads Google Chrome and Microsoft Teams as a .deb file from the internet and installs them
 * Installs programs from the apt application
   * htop
   * nmap
   * sl
   * guake
   * neofetch
   * vlc
   * Grub customizer (needs to be run manually to configure the bootloader)
 * Installs programs from the snap store
   * Visual Studio Code
   * Spotify
 * Adds the mkcd command to the terminal (Creates a directory and moves the cursor into it.)
 * Fixes dual-boot time differences (System clock uses local time)
 * Installs ROS
   * ROS2 version Foxy
   * Desktop version, all development software is included
   * Adds auto-ROS sourcing to the .bashrc file
   * Adds the alias `sauce`, which sources the current project. Assumes that the user is positioned in the root of the project.

## Recommended next steps
 * Add guake to the auto-start list of Ubuntu
 * Create SSH-keys, and add them to your online accounts
 * Edit fstab to auto-mount often used partitions
 * Run Grub customizer
 * [Install `chntpw` to copy Bluetooth keys from Windows to Linux](https://unix.stackexchange.com/questions/255509/bluetooth-pairing-on-dual-boot-of-windows-linux-mint-ubuntu-stop-having-to-p), to make sure that your Bluetooth devices automatically connect to both Ubuntu and Windows.