# Official Python base image is needed or some applications will segfault.
FROM python:3.6-alpine3.6

# PyInstaller needs zlib-dev, gcc, libc-dev, and musl-dev

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
    && apk --update --no-cache add \
        zlib-dev \
        musl-dev \
        libc-dev \
        linux-headers \
        g++ \
        git \
        pwgen \
        zeromq-dev \
        libzmq \
        libxml2-dev \
        libxslt-dev \
        upx \
    && pip install --upgrade pip

# Install pycrypto so --key can be used with PyInstaller
RUN pip install \
    pycrypto

ARG PYINSTALLER_TAG=v3.3

# Build bootloader for alpine
RUN git clone --depth 1 --single-branch --branch $PYINSTALLER_TAG https://github.com/pyinstaller/pyinstaller.git /tmp/pyinstaller \
    && cd /tmp/pyinstaller/bootloader \
    && python ./waf configure --no-lsb all \
    && pip install .. \
    && rm -Rf /tmp/pyinstaller

VOLUME /src
WORKDIR /src

ADD ./bin /pyinstaller
RUN chmod a+x /pyinstaller/*

ENTRYPOINT ["/pyinstaller/pyinstaller.sh"]
