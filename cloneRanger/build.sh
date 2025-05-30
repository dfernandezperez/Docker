#! /bin/bash
IMAGE_VERSION=$(date '+%d%m%y')

docker build -t dfernand/cloneranger:${IMAGE_VERSION} -t dfernand/cloneranger:latest . &

# Push docker image if build run successful and image exists
if docker run --rm dfernand/cloneranger:${IMAGE_VERSION}; then
    docker push dfernand/cloneranger:${IMAGE_VERSION} && docker push dfernand/cloneranger:latest
else
    echo "Docker build failed."
fi