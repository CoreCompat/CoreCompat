#!/bin/sh

path=$(pwd)
out="$path/out/usr/local"

# Remove the output folder, if it already exists
rm -rf "$out"

# The X11 headers are installed via Xquartz, and they are installed in
# /usr/X11 instead of /opt, where ./autogen seems to expect them
cd "$path/libgdiplus"
./autogen.sh --prefix="$out" CPPFLAGS="-I/usr/X11/include/"
make clean
make
make install

# Copy the dependent dylibs from /usr/local/opt to the $out dir
dylibs=`otool -L "$out/lib/libgdiplus.dylib" | grep "/usr/local" | awk -F' ' '{ print $1 }'`

for dylib in $dylibs; do
  cp $dylib "$out/lib/"
done;

# libcairo has a dependency on libpixman, so include that one, too
cp /usr/local/opt/pixman/lib/libpixman-1.0.dylib "$out/lib"
cp /usr/local/lib/libpcre.1.dylib "$out/lib"

# Patch the dylib dependencies for all .dylib files in the out directory
for f in "$out/lib/"*.dylib; do
   chmod +w "$f"

   # Skip the first two lines of the otool output, this is just the name of the dylib itself
   dylibs=`otool -L "$f" | tail -n +3 | grep "/usr/local" | awk -F' ' '{ print $1 }'`

   for dylib in $dylibs; do
     basename=`basename "$dylib"`

     if [ ! -f "$out/lib/$basename" ]; then
        echo "error: The dylib file '$out/lib/$basename' does not exist in the output folder; referenced from $f"
     fi

     # https://www.mikeash.com/pyblog/friday-qa-2009-11-06-linking-and-install-names.html
     install_name_tool -change "$dylib" "@loader_path/$basename" "$f"
   done;

   # otool -L "$f"
done

