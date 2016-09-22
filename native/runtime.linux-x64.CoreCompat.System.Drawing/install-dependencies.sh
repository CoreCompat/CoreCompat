#!/bin/sh

sudo apt-get install -y libgtk2.0-dev libtiff5-dev libjpeg-dev libgif-dev libexif-dev

# We need patchelf 0.9; Ubuntu 16.04 includes 0.8 (sigh)
rm -rf patchelf-0.9 patchelf-0.9.tar.gz
wget https://nixos.org/releases/patchelf/patchelf-0.9/patchelf-0.9.tar.gz 
tar -xvzf patchelf-0.9.tar.gz
cd patchelf-0.9
./configure
make
cd ..

# And a build of cairo which doesnt rely on X
rm -rf cairo-1.14.6.tar.x cairo-1.14.6
wget https://cairographics.org/releases/cairo-1.14.6.tar.xz
tar -xvf cairo-1.14.6.tar.xz
# rm -rf cairo-1.14.6/util/cairo-script/examples
