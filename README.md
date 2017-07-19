docker-node
===========

> Docker images with node and yarn.

[![docker:simbo/node](https://img.shields.io/docker/build/simbo/node.svg)](https://hub.docker.com/r/simbo/node/)

Derivate of [official node image](https://hub.docker.com/_/node/) with
timezone set to “Europe/Berlin” and some common environment settings.

The alpine version has python, make and gcc installed to support node-gyp.

  - `simbo/node:latest` (jessie with common libs)
  - `simbo/node:latest-slim` (minimum jessie)
  - `simbo/node:latest-alpine` (alpine)

``` sh
docker pull simbo/node:latest
docker pull simbo/node:latest-slim
docker pull simbo/node:latest-alpine
```

See also [simbo/node/tags](https://hub.docker.com/r/simbo/node/tags/).
