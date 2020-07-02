#! /bin/bash
IMAGE_VERSION=010720
docker build --no-cache -t dfernand/chipseq:${IMAGE_VERSION} -t dfernand/chipseq:latest .