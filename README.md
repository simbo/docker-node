docker-node
===========

> Docker images with node.js

[![docker:simbo/node](https://img.shields.io/docker/build/simbo/node.svg)](https://hub.docker.com/r/simbo/node/)

These images are derivates of the [official node images](https://hub.docker.com/_/node/) with the following changes:

  - timezone set to “Europe/Berlin”
  - simple prompt with current path
  - yarn self-update check disabled

Beside the same variations like the original node image, there is also a `*-gyp` version available, which includes all requirements to use [node-gyp](https://github.com/nodejs/node-gyp):

  - `simbo/node:latest` (debian with common libs)
  - `simbo/node:latest-slim` (minimum debian with curl)
  - `simbo/node:latest-gyp` (slim with node-gyp requirements)
  - `simbo/node:latest-alpine` (alpine)

```sh
docker pull simbo/node:latest
docker pull simbo/node:latest-slim
docker pull simbo/node:latest-gyp
docker pull simbo/node:latest-alpine
```

It is not recommended to use images with the tag `latest` as they refer to the latest build and not necessarily to the latest version.

See the [tags list](https://hub.docker.com/r/simbo/node/tags/) for all available image versions.


## Releasing new versions

See the release script `release-version.sh` for automatically updating dockerfiles and triggering new image releases, using GitHub, Travis CI and Docker Hub.

Usage: `./release-version.sh <SEMVER_VERSION>`

Example: `./release-version.sh 8.11.2`
