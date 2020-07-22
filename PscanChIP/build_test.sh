#! /bin/bash
IMAGE_VERSION=$(date '+%d%m%y')
docker build -t dfernand/pscanchip:${IMAGE_VERSION} -t dfernand/pscanchip:latest .
docker push dfernand/pscanchip:${IMAGE_VERSION} && docker push dfernand/pscanchip:latest