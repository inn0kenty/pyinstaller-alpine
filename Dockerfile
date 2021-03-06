ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-alpine

RUN apk --update --no-cache add \
    bash \
    build-base \
    freetype-dev \
    fribidi-dev \
    g++ \
    gfortran \
    git \
    harfbuzz-dev \
    jpeg-dev \
    lcms2-dev \
    libc-dev \
    libxml2-dev \
    libxslt-dev \
    libzmq \
    linux-headers \
    musl-dev \
    openblas-dev \
    openjpeg-dev \
    openssl \
    pkgconfig \
    postgresql-dev \
    pwgen \
    python3-dev \
    sudo \
    tcl-dev \
    tiff-dev \
    tk-dev \
    upx \
    zeromq-dev \
    zlib-dev \
    curl \
    && pip install --no-cache-dir --upgrade pip

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=on \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

ARG PYINSTALLER_TAG

# Build pyinstaller
RUN git clone --depth 1 --single-branch --branch ${PYINSTALLER_TAG} \
    https://github.com/pyinstaller/pyinstaller.git /tmp/pyinstaller \
    && cd /tmp/pyinstaller/bootloader \
    && python ./waf configure --no-lsb all \
    && cd .. && python setup.py install \
    && rm -Rf /tmp/pyinstaller

ENTRYPOINT ["/bin/sh"]
