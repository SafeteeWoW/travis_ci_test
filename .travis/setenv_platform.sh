if [ -z "${PLATFORM:-}" ]; then
  export PLATFORM=$TRAVIS_OS_NAME;
fi

if [ "$PLATFORM" == "osx" ]; then
  export PLATFORM="macosx";
fi

if [ -z "$PLATFORM" ]; then
  if [ "$(uname)" == "Linux" ]; then
    export PLATFORM="linux";
  else
    export PLATFORM="macosx";
  fi;
fi
