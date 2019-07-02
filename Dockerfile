FROM rust:latest

RUN apt-get update && apt-get -y install libdbus-1-dev

WORKDIR /usr/src/myapp
COPY . .

RUN rustup target add armv7-unknown-linux-gnueabihf