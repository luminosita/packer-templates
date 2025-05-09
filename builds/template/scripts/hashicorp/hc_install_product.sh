#!/bin/bash

install() {
    wget https://releases.hashicorp.com/$1/$2/$1_$2_linux_amd64.zip && \
    wget https://releases.hashicorp.com/$1/$2/$1_$2_SHA256SUMS && \
    wget https://releases.hashicorp.com/$1/$2/$1_$2_SHA256SUMS.sig && \
    wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
    gpg --verify $1_$2_SHA256SUMS.sig $1_$2_SHA256SUMS && \
    grep $1_$2_linux_amd64.zip $1_$2_SHA256SUMS | sha256sum -c && \
    unzip $1_$2_linux_amd64.zip -d /tmp && \
    sudo mv /tmp/$1 /usr/local/bin/$1 && \
    rm -f $1_$2_linux_amd64.zip $1_$2_SHA256SUMS $1_$2_SHA256SUMS.sig && \
    rm -f /tmp/LICENSE.txt
}