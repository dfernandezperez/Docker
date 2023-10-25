#!/bin/bash

source config.sh

# build ${image_name}:${version}
docker build \
    --tag ${image_name}:${version} \
    --tag ${image_name}:latest \
    --build-arg COMMIT_HASH=${commit_hash} .