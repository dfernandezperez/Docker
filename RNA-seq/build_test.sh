#! /bin/bash
IMAGE_VERSION=$(date '+%d%m%y')
docker build --no-cache -t dfernand/rnaseq-snakemake:${IMAGE_VERSION} -t dfernand/rnaseq-snakemake:latest . && \
docker push dfernand/rnaseq-snakemake:${IMAGE_VERSION}
docker push dfernand/rnaseq-snakemake:latest