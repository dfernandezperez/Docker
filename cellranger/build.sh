#!/bin/bash

source config.sh

# get download url for Cell Ranger
if [ ! -n "$download_url" ]
then
echo "Please define a download link!"
fi

# build ${image_name}:${version}
docker build \
    --tag ${image_name}:${version} \
    --build-arg DOWNLOAD_URL=${download_url} \
    --build-arg CELLRANGER_VERSION=${version} .