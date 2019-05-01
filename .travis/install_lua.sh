#!/bin/bash
# install an implementation of Lua interpreter

set -eufo pipefail
cd "$(dirname "$0")"
mkdir -p $HOME/install
export PATH=${PATH}:$HOME/.lua:$HOME/.local/bin:${HOME}/install/luarocks/bin
export LUA_HOME_DIR=$HOME/install/$LUA
export LR_HOME_DIR=$HOME/install/luarocks

eval `$HOME/.lua/luarocks path`
cd ${TRAVIS_BUILD_DIR}

if [[ "$LUA" =~ luajit.* ]]; then
	bash install_lua/luajit.sh
elif [[ "$LUA" =~ lua5.* ]]; then
	bash install_lua/lua.sh
else
	echo "Don't know how to install $LUA"
	exit 1
fi
