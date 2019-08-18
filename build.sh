#! /bin/sh

docker build -t arm64/rust .
docker run --rm -v `pwd`:/project -v `pwd`/cache/git:/home/builder/.cargo/git -v `pwd`/cache/registry:/home/builder/.cargo/registry -v `pwd`/cache/.package-cache:/home/builder/.cargo/.package-cache arm64/rust

