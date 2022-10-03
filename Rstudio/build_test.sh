#! /bin/bash
IMAGE_VERSION=$(date '+%d%m%y')

docker build -t dfernand/rstudio:${IMAGE_VERSION} -t dfernand/rstudio:latest . &

# Push docker image if build run successful and image exists
if docker run --rm dfernand/rstudio:${IMAGE_VERSION}; then
    docker push dfernand/rstudio:${IMAGE_VERSION} && docker push dfernand/rstudio:latest
else
    echo "Docker build failed."
fi