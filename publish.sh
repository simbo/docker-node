#!/bin/bash

# run `docker login` first

set -ex

VERSION_MAJOR="8"
VERSION_MINOR="1"
VERSION_PATCH="4"

IMAGE_NAME="simbo/node"

IMAGE_FULL=${IMAGE_NAME}:${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}

docker build --no-cache --pull -t ${IMAGE_FULL} .
docker build --no-cache --pull -f Dockerfile-slim -t ${IMAGE_FULL}-slim .
docker build --no-cache --pull -f Dockerfile-alpine -t ${IMAGE_FULL}-alpine .
docker tag ${IMAGE_FULL} ${IMAGE_NAME}:latest
docker tag ${IMAGE_FULL} ${IMAGE_NAME}:${VERSION_MAJOR}.${VERSION_MINOR}
docker tag ${IMAGE_FULL} ${IMAGE_NAME}:${VERSION_MAJOR}
docker tag ${IMAGE_FULL}-slim ${IMAGE_NAME}:latest-slim
docker tag ${IMAGE_FULL}-slim ${IMAGE_NAME}:${VERSION_MAJOR}.${VERSION_MINOR}-slim
docker tag ${IMAGE_FULL}-slim ${IMAGE_NAME}:${VERSION_MAJOR}-slim
docker tag ${IMAGE_FULL}-alpine ${IMAGE_NAME}:latest-alpine
docker tag ${IMAGE_FULL}-alpine ${IMAGE_NAME}:${VERSION_MAJOR}.${VERSION_MINOR}-alpine
docker tag ${IMAGE_FULL}-alpine ${IMAGE_NAME}:${VERSION_MAJOR}-alpine
docker push ${IMAGE_NAME}
