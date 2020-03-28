FROM debian:latest

WORKDIR /app

ENV GLUON_VERSION=master
ENV GLUON_RELEASE=${GLUON_VERSION}
ENV GLUON_TARGET=x86-64
ENV GLUON_DEPRECATED=full

COPY entrypoint.sh /scripts/entrypoint.sh
RUN chmod +x /scripts/entrypoint.sh

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

ENTRYPOINT [ "/scripts/entrypoint.sh" ]
