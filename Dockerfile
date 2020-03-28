FROM debian:latest

WORKDIR /app
COPY entrypoint.sh /scripts/entrypoint.sh

RUN apt update && apt install -y \
    git \
    subversion \
    python \
    build-essential \
    gawk \
    unzip \
    libncurses5-dev \
    zlib1g-dev \
    libssl-dev \
    wget \
    time && \
    rm -rf /var/lib/apt/lists/*

ENV GLUON_VERSION=master
ENV GLUON_TARGET=x86-64

ENTRYPOINT [ "/scripts/entrypoint.sh" ]
