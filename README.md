docker-node
===========

> Docker images with node.js

[![docker:simbo/node](https://img.shields.io/docker/build/simbo/node.svg)](https://hub.docker.com/r/simbo/node/)

These images are derivates of the [official node images](https://hub.docker.com/_/node/) with the following changes:

  - timezone set to “Europe/Berlin”
  - simple prompt with current path
  - yarn self-update check disabled

Beside the same variations like the original node image, there is also a `*-gyp` version available, which includes all requirements to use [node-gyp](https://github.com/nodejs/node-gyp):

  - `simbo/node:latest` (jessie with common libs)
  - `simbo/node:latest-slim` (minimum jessie with curl)
  - `simbo/node:latest-gyp` (slim with node-gyp requirements)
  - `simbo/node:latest-alpine` (alpine)

```sh
docker pull simbo/node:latest
docker pull simbo/node:latest-slim
docker pull simbo/node:latest-gyp
docker pull simbo/node:latest-alpine
```

See the [tags list](https://hub.docker.com/r/simbo/node/tags/) for all available image versions.
