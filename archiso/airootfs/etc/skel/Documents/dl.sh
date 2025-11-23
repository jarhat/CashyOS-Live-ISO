#!/bin/bash
for i in $(cat bitcoin-paper.urls | cut -d"," -f1); do
    wget "https://bitcoin.org$i"
done
