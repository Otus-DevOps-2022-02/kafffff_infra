#!/bin/sh
sudo apt-get update

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend

sudo apt-get install -y ruby-full ruby-bundler build-essential
