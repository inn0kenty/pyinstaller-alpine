#!/bin/sh

REPO="inn0kenty/pyinstaller-alpine"

docker push $REPO:2.7
docker push $REPO:3.5
docker push $REPO:3.6
docker push $REPO:3.7
docker push $REPO:3.8
