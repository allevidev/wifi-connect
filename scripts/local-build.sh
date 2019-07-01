#!/bin/bash

set -ev

if [ -z "$1" ]; then
	printf 'Rust compilation target not specified'
	exit 1
fi

TARGET=$1
ARCH=$2

cross() {
    docker run -it --rm -v $PWD:/work rust:latest "$@"
}

cross cargo build --release --target=$TARGET

cross cross-strip target/$TARGET/release/wifi-connect
