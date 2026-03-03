FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        clang \
        gdb \
        python3 \
        python3-pip \
        vim \
        file \
        strace \
        ltrace \
        binutils \
        checksec && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work

CMD ["/bin/bash"]
