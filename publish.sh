#!/bin/bash

# run `docker login` first

set -ex

VERSION="8.1.4"
IMAGE_NAME="simbo/node"

docker build -t ${IMAGE_NAME}:${VERSION} .
docker build -f Dockerfile-slim -t ${IMAGE_NAME}:${VERSION}-slim .
docker build -f Dockerfile-alpine -t ${IMAGE_NAME}:${VERSION}-alpine .
docker tag ${IMAGE_NAME}:${VERSION} ${IMAGE_NAME}:latest
docker tag ${IMAGE_NAME}:${VERSION}-slim ${IMAGE_NAME}:latest-slim
docker tag ${IMAGE_NAME}:${VERSION}-alpine ${IMAGE_NAME}:latest-alpine
docker push ${IMAGE_NAME}
