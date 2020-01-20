#!/bin/sh
# Simple wrapper around pyinstaller

set -e

# Check that install requires is needed
if [ "$1" == "--skip-req-install" ]; then
    skip_req_install=1
    shift
fi

# Generate a random key for encryption
random_key=$(pwgen -s 16 1)
pyinstaller_args="${@/--random-key/--key $random_key}"

# Use the hacked ldd to fix libc.musl-x86_64.so.1 location
PATH="/pyinstaller:$PATH"

if [ -z "$skip_req_install" ]; then
    if [ -f requirements.txt ]; then
        pip install -r requirements.txt
    elif [ -f setup.py ]; then
        pip install .
    fi
fi

# Exclude pycrypto and PyInstaller from built packages
exec pyinstaller \
    --exclude-module pycrypto \
    --exclude-module PyInstaller \
    --exclude-module poetry \
    ${pyinstaller_args}
