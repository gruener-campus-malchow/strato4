#!/bin/bash

if [ `whoami` != root ]; then
    echo Please run this script as root or using sudo
    exit
fi

if [ -z $1 ];
then
    echo "Please put the camera name as first commandline argument"
    echo "allowed values: horizoncam earthcam dumbcam"
    exit
fi

echo "Updating..."
sudo apt update
sudo apt upgrade

echo "Installing packages..."
sudo apt install git python3-picamera
sudo apt install i2cdetect
sudo apt install i2c-tools

echo "Cloning repository..."
git clone https://github.com/gruener-campus-malchow/strato4.git

echo "Opening config..."
sudo nano /boot/config.txt
sudo raspi-config
sudo reboot

echo "Setting up hwclock..."
sudo apt-get -y remove fake-hwclock
sudo update-rc.d -f fake-hwclock remove
sudo systemctl disable fake-hwclock
sudo nano /lib/udev/hwclock-set
sudo i2cdetect -y 1
sudo hwclock -r

echo "Installing crontab"
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "@reboot /usr/bin/python3 /home/pi/strato4/$1/frequency.py >> /home/pi/$1.log" >> mycron
#install new cron file
crontab mycron
rm mycron