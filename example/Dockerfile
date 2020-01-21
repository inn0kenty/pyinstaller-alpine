FROM inn0kenty/pyinstaller-alpine:3.7 as build

WORKDIR /build

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# If you nedd add some PyInstaller hooks (https://pythonhosted.org/PyInstaller/hooks.html)
# create hooks dir and add key --additional-hooks-dir=hooks

RUN pyinstaller --noconfirm --clean --onefile --name app example.py

FROM alpine:3.11

WORKDIR /app

RUN addgroup -S app \
    && adduser -S -G app app \
    && chown app:app .

USER app

COPY --from=build /build/dist/app .

ENTRYPOINT ["./app"]
