#!/bin/bash
# install an implementation of Lua interpreter

set -eufo pipefail
mkdir -p $HOME/install
mkdir -p $HOME/.lua
export PATH=${PATH}:$HOME/.lua:$HOME/.local/bin:${HOME}/install/luarocks/bin
export LUA_HOME_DIR=$HOME/install/$LUA
export LR_HOME_DIR=$HOME/install/luarocks

cd ${TRAVIS_BUILD_DIR}

if [[ "$LUA" =~ luajit.* ]]; then
	bash ${TRAVIS_BUILD_DIR}/.travis/install_lua/luajit.sh
elif [[ "$LUA" =~ lua5.* ]]; then
	bash ${TRAVIS_BUILD_DIR}/.travis/install_lua/lua.sh
else
	echo "Don't know how to install $LUA"
	exit 1
fi


cd ${TRAVIS_BUILD_DIR}
