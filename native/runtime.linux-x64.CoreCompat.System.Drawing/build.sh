#!/bin/bash

path=$(pwd)
out=$path/out/usr/local

# Remove the output folder, if it already exists
rm -rf $out

cd $path/libgdiplus
./autogen.sh --prefix=$out --without-x11
make clean
make
make install

cp /lib/x86_64-linux-gnu/libglib-2.0.so.0 $out/lib
cp /usr/lib/x86_64-linux-gnu/libcairo.so.2 $out/lib
cp /usr/lib/x86_64-linux-gnu/libfreetype.so.6 $out/lib
cp /usr/lib/x86_64-linux-gnu/libjpeg.so.8 $out/lib
cp /usr/lib/x86_64-linux-gnu/libtiff.so.5 $out/lib
cp /usr/lib/x86_64-linux-gnu/libgif.so.7 $out/lib
cp /usr/lib/x86_64-linux-gnu/libpng12.so.0 $out/lib
cp /usr/lib/x86_64-linux-gnu/libexif.so.12 $out/lib

# For more info, see: https://github.com/NixOS/patchelf
# http://man7.org/linux/man-pages/man8/ld.so.8.html
patchelf=$path/patchelf-0.9/src/patchelf

for f in $out/lib/*.so*; do
  $patchelf --set-rpath '${ORIGIN}' $f
done
