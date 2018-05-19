docker-node
===========

> Docker images with node.js

[![travis:simbo/docker-node](https://travis-ci.org/simbo/docker-node.svg?branch=master)](https://travis-ci.org/simbo/docker-node/builds)  [![Docker Pulls](https://img.shields.io/docker/pulls/simbo/node.svg)](https://hub.docker.com/r/simbo/node)


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

See the release script `release-version.sh` for automatically updating dockerfiles and triggering new image releases using GitHub, Travis CI and Docker Hub.

Usage: `./release-version.sh <SEMVER_VERSION>`

Example: `./release-version.sh 10.1.0`

Example output:

```
# ./release-version.sh 10.1.0
This script will update all dockerfiles in this repository to node.js version 10.1.0.
Changes will be committed, tagged with 10.1.0 and pushed to GitHub.
That should trigger Travis CI, where images will be built and released to Docker Hub tagged with 10, 10.1 and 10.1.0.
Do you want to continue? (y/n) y

[master 7d66bbf] node.js v10.1.0
 4 files changed, 4 insertions(+), 4 deletions(-)
Counting objects: 7, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (7/7), 694 bytes | 347.00 KiB/s, done.
Total 7 (delta 5), reused 0 (delta 0)
remote: Resolving deltas: 100% (5/5), completed with 5 local objects.
To github.com:simbo/docker-node.git
   62dbed0..7d66bbf  master -> master
 * [new tag]         10.1.0 -> 10.1.0

All done.
See Travis CI for further actions: https://travis-ci.org/simbo/docker-node/builds
See Docker Hub for released images: https://hub.docker.com/r/simbo/node/tags
```