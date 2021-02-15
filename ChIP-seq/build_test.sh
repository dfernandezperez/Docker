#! /bin/bash
IMAGE_VERSION=$(date '+%d%m%y')
docker build --no-cache -t dfernand/chipseq:${IMAGE_VERSION} -t dfernand/chipseq:latest .
