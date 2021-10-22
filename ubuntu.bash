# Update the system to the latest version
sudo apt update -y
sudo apt upgrade -y
sudo apt update -y

# Download .deb files
DEB_FOLDER=~/Downloads/deb-install-files
mkdir $DEB_FOLDER -p
wget -O $DEB_FOLDER/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -O $DEB_FOLDER/teams.deb https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.4855_amd64.deb
sudo dpkg -i $DEB_FOLDER/chrome.deb
sudo dpkg -i $DEB_FOLDER/teams.deb

# Install apt programs
sudo apt install htop nmap sl guake neofetch vlc -y

# Install snap programs
sudo snap install code --classic
sudo snap install spotify

# Bashrc configuration
cat included/mkcd.bash >> ~/.bashrc

# Dual boot time fix (Linux uses localtime from the system clock)
timedatectl set-local-rtc 1

# ROS2 foxy install
sudo apt install curl gnupg2 lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update
sudo apt install ros-foxy-desktop python3-colcon-common-extensions -y
echo -e '\n# Source the ROS installation\nsource /opt/ros/foxy/setup.bash\n' >> ~/.bashrc
echo -e "\n# Adds the alias sauce to source a ROS project\nalias sauce='. install/setup.bash'" >> ~/.bashrc
