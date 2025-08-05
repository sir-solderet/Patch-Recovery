#!/bin/bash

if file "$1" | grep -q "LZ4 compressed data"; then
    cp "$1" r.img.lz4
	lz4 -B6 --content-size -f r.img.lz4 r.img
else
    cp "$1" r.img
fi

if [ ! -f phh.pem ];then
    openssl genrsa -f4 -out phh.pem 4096
fi
