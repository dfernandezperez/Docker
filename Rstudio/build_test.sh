#! /bin/bash
IMAGE_VERSION=$(date '+%d%m%y')
# docker build --no-cache -t dfernand/rstudio:${IMAGE_VERSION} -t dfernand/rstudio:latest . && \
docker build -t dfernand/rstudio:${IMAGE_VERSION} -t dfernand/rstudio:latest . && \
docker push dfernand/rstudio:${IMAGE_VERSION}
docker push dfernand/rstudio:latest