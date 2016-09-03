#!/bin/bash

path=$(pwd)
out=$path/out/usr/local

# Remove the output folder, if it already exists
rm -rf $out

cd $path/libgdiplus
./autogen.sh --prefix=$out
make clean
make
make install


