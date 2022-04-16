#!/bin/bash

sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

verub=$(ruby -v)
verbun=$(bundler -v)

if [[ $verub = "ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]" && $verbun = "Bundler version 1.11.2" ]]
then
  echo "installation done!"
else
  echo "bad installation!"
fi
