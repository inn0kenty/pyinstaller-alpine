#!/bin/sh

if [[ $(id -u) -eq 0 ]]; then
  echo "This app must NOT be run as root" 1>&2
  exit 1
fi

./app $@
