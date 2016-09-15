#!/bin/sh

test -e emsdk-portable.tar.gz || wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz

tar zxvf emsdk-portable.tar.gz

./emsdk_portable/emsdk update

./emsdk_portable/emsdk install latest

./emsdk_portable/emsdk activate latest

echo
echo "now run"
echo
echo source ./emsdk_portable/emsdk_env.sh
