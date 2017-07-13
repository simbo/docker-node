docker-node
===========

> Docker images with node and yarn.

[![docker:simbo/node](https://img.shields.io/badge/docker-simbo%2Fnode-blue.svg)](https://hub.docker.com/r/simbo/node/tags/)

``` sh
docker pull simbo/node:latest
docker pull simbo/node:latest-slim
docker pull simbo/node:latest-alpine
```

Derivated from [official node image](https://hub.docker.com/_/node/) with
timezone set to `Europe/Berlin` and some common bash aliases.

See [github.com/simbo/docker-node](https://github.com/simbo/docker-node) for
Dockerfiles.

  - `simbo/node:latest` (debian jessie with common libs)
  - `simbo/node:latest-slim` (debian jessie with minimum requirements)
  - `simbo/node:latest-alpine` (alpine)
