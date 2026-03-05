FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        clang \
        git \
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

RUN git clone https://github.com/pwndbg/pwndbg /opt/pwndbg && \
    cd /opt/pwndbg && \
    ./setup.sh

RUN echo "alias sl='ls'" >> /root/.bashrc


WORKDIR /work

CMD ["/bin/bash"]
