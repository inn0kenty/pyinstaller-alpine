[![Build Status](https://github.com/inn0kenty/pyinstaller-alpine/workflows/Build%20and%20publish/badge.svg)](https://github.com/inn0kenty/pyinstaller-alpine/actions)

PyInstaller Alpine
==================

Docker image that can build single file Python apps with
[PyInstaller](http://pyinstaller.readthedocs.io/) for
[Alpine Linux](http://www.alpinelinux.org/).

Alpine uses [musl](https://www.musl-libc.org/) instead of
[glibc](https://www.gnu.org/software/libc/). The PyInstaller bootloader for
Linux 64 that comes with PyInstaller is made for glibc. This Docker image
builds a bootloader with musl.

This Docker image also provides a clean way to build PyInstaller apps in
an isolated environment.

Usage
-----

### Docker Image Tags

You can use:

 - inn0kenty/pyinstaller-alpine:3.8 for Python 3.8
 - inn0kenty/pyinstaller-alpine:3.7 for Python 3.7
 - inn0kenty/pyinstaller-alpine:3.6 for Python 3.6
 - inn0kenty/pyinstaller-alpine:3.5 for Python 3.5
 - inn0kenty/pyinstaller-alpine:2.7 for Python 2.7

All images updates every sunday.

### Build

This images should be used with docker multi-stage builds.

See docker [documentation](https://docs.docker.com/v17.09/engine/userguide/eng-image/multistage-build/) and example folder.

### Reproducible Build

If you want a [Reproducible Build](https://pythonhosted.org/PyInstaller/advanced-topics.html#creating-a-reproducible-build)
when your source has not changed, you can pass a `PYTHONHASHSEED` env variable
for consistent randomization for internal data structures.
