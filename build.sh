#!/bin/bash

export PYTHON_VERSION=${1:-3.6}
export ALPINE_VERSION=${2:-3.6}
export PYINSTALLER_TAG=${3:-v3.3}

REPO="inn0kenty/pyinstaller-alpine:$PYTHON_VERSION"

if [[ "$PYTHON_VERSION" == "3.5" ]]; then
    ALPINE_VERSION=""
fi

echo "python: $PYTHON_VERSION"
echo "alpine: $ALPINE_VERSION"

docker build \
    --build-arg PYTHON_VERSION=$PYTHON_VERSION \
    --build-arg ALPINE_VERSION=$ALPINE_VERSION \
    --build-arg PYINSTALLER_TAG=$PYINSTALLER_TAG \
    -t $REPO .

docker push $REPO
