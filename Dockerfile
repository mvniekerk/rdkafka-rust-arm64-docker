FROM amd64/ubuntu:bionic

COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN apt-get update; apt install -y build-essential curl librdkafka-dev clang;
RUN useradd -ms /bin/bash builder; mkdir /project; chown builder /project
USER builder
WORKDIR /home/builder
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup.sh; sh rustup.sh -y
WORKDIR /project
CMD bash -c "source $HOME/.cargo/env && cargo build --release --target-dir ./target/arm64"
