#!/bin/bash

sudo apt-get install -y libgtk2.0-dev libtiff5-dev libjpeg-dev libgif-dev libexif-dev

# We need patchelf 0.9; Ubuntu 16.04 includes 0.8 (sigh)
wget https://nixos.org/releases/patchelf/patchelf-0.9/patchelf-0.9.tar.gz 
tar -xvzf patchelf-0.9.tar.gz
cd patchelf-0.9
./configure
make
cd ..
