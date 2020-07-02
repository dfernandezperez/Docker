#! /bin/bash
IMAGE_VERSION=010720
docker build --no-cache -t dfernand/rnaseq-snakemake:${IMAGE_VERSION} -t dfernand/rnaseq-snakemake:latest .