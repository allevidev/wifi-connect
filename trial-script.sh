set -v
docker build -t $1 .
docker run $1:latest cargo build --release --target=armv7-unknown-linux-gnueabihf
docker run $1:latest cross-strip target/armv7-unknown-linux-gnueabihf/release/wifi-connect