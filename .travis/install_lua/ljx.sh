#! /bin/bash
# helper script o compile and install luajit, luarocks and some libraries

set -eufo pipefail
if [[ ! "$LUA" =~  ljx.* ]]; then
	echo "env variable does not match luajit. abort"
	exit 1
fi

VERSION="${LUA/ljx/}"
echo ">> Downloading $LUA"
echo "lJX version: $VERSION"

curl --retry 10 --retry-delay 10 --location https://github.com/katlogic/ljx/archive/LJX-v${VERSION}.zip | tar xz;

cd ljx-LJX-v$VERSION
echo ">> Compiling LuaJIT $VERSION"

make && make install PREFIX="$LUA_HOME_DIR"

ln -s -f $LUA_HOME_DIR/bin/ljx $HOME/.lua/lua

hash -r
lua -v

cd $TRAVIS_BUILD_DIR
