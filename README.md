docker-node
===========

> Docker images with node and yarn.

[![docker:simbo/node](https://img.shields.io/docker/build/simbo/node.svg)](https://hub.docker.com/r/simbo/node/)

Derivated from [official node image](https://hub.docker.com/_/node/) with
timezone set to `Europe/Berlin` and some common bash aliases.

``` sh
docker pull simbo/node:latest
docker pull simbo/node:latest-slim
docker pull simbo/node:latest-alpine
```

  - `simbo/node:latest` (debian jessie with common libs)
  - `simbo/node:latest-slim` (debian jessie with minimum requirements)
  - `simbo/node:latest-alpine` (alpine)
