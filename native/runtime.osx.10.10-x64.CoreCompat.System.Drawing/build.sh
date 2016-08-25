#!/bin/bash

path=$(pwd)
out=$path/out/usr/local

# Remove the output folder, if it already exists
rm -rf $out

# The X11 headers are installed via Xquartz, and they are installed in
# /usr/X11 instead of /opt, where ./autogen seems to expect them
cd $path/libgdiplus
./autogen.sh --prefix=$out CPPFLAGS="-I/usr/X11/include/"
make clean
make
make install


