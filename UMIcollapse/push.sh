#!/bin/bash

source config.sh

docker push ${image_name}:${version}
docker push ${image_name}:latest