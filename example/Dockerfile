FROM inn0kenty/pyinstaller-alpine:3.7 as build

WORKDIR /build

COPY requirements.txt .
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements.txt

COPY . .
ARG PYINSTALLER_ARG
RUN /pyinstaller/pyinstaller.sh --skip-req-install --random-key $PYINSTALLER_ARG

FROM alpine:3.8

# TODO: change it!
LABEL maintainer=""

WORKDIR /app

RUN addgroup -S app \
    && adduser -S -G app app \
    && chown app:app .

USER app

COPY entrypoint.sh .

COPY --from=build /build/dist/app .

ENTRYPOINT ["./entrypoint.sh"]
