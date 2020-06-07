#!/bin/bash

LATEST_PYINSTALLER_TAG=$(curl --silent \
    "https://api.github.com/repos/pyinstaller/pyinstaller/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/')

REPO="inn0kenty/pyinstaller-alpine"

echo "use repo: $REPO"
echo

build() {
    PYTHON_VERSION=${1}
    PYINSTALLER_TAG=${2:-$LATEST_PYINSTALLER_TAG}

    echo "python: $PYTHON_VERSION"
    echo "pyinstaller: $PYINSTALLER_TAG"

    docker build \
        --pull \
        --build-arg PYTHON_VERSION=$PYTHON_VERSION \
        --build-arg PYINSTALLER_TAG=$PYINSTALLER_TAG \
        -t $REPO:$PYTHON_VERSION .
}

push() {
    PYTHON_VERSION=${1}
    docker push $REPO:$PYTHON_VERSION
}

versions=(3.5 3.6 3.7 3.8)

case $1 in
build)
    for v in ${versions[@]}; do
        build $v
    done
    ;;
push)
    for v in ${versions[@]}; do
        push $v
    done
    ;;
build_specific)
    build $2
    ;;
*)
    echo "Define build or push command"
    exit 1
    ;;
esac
