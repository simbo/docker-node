docker-node
===========

> Docker images with node.js and some opinionated settings.

[![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/simbo/docker-node/CI/master)](https://github.com/simbo/docker-node/actions?query=workflow%3ACI)
[![Docker Pulls](https://img.shields.io/docker/pulls/simbo/node.svg)](https://hub.docker.com/r/simbo/node)


These images are derivates of the [official node images](https://hub.docker.com/_/node/)
with the following changes:

  - timezone set to “Europe/Berlin”
  - simple prompt with current path and docker image name
  - yarn self-update check disabled
  - debian images have nano installed and set as default editor

Beside the same variations like the original node image, there is also a `*-gyp`
version available, which includes all requirements to use [node-gyp](https://github.com/nodejs/node-gyp):

  - `simbo/node:<VERSION>` (debian buster with common libs)
  - `simbo/node:<VERSION>-slim` (minimum debian buster with curl)
  - `simbo/node:<VERSION>-gyp` (slim with node-gyp requirements)
  - `simbo/node:<VERSION>-alpine` (alpine)

```sh
docker pull simbo/node:<VERSION>
docker pull simbo/node:<VERSION>-slim
docker pull simbo/node:<VERSION>-gyp
docker pull simbo/node:<VERSION>-alpine
```

It is not really recommended to use images with the tag `latest` as they refer
to the latest build and not necessarily to the latest version.

See the [tags list](https://hub.docker.com/r/simbo/node/tags/) for all available
image versions.


## Releasing new versions

See the release script `release-version` for automatically updating dockerfiles
and triggering new image releases using GitHub, Travis CI and Docker Hub.

Usage: `./release-version <SEMVER_VERSION>`

Example: `./release-version 10.1.0`

Example output:

```
# ./release-version 14.15.3
This script will update all dockerfiles in this repository to node.js version 14.15.3.
Changes will be committed, tagged with 14.15.3 and pushed to GitHub.
This push should trigger GitHub Actions, where images will be built and released to Docker Hub tagged with 14, 14.15 and 14.15.3.
Press [ENTER] to continue or anything else to cancel.

[master 7d66bbf] node.js v14.15.3
 4 files changed, 4 insertions(+), 4 deletions(-)
Counting objects: 7, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (7/7), 694 bytes | 347.00 KiB/s, done.
Total 7 (delta 5), reused 0 (delta 0)
remote: Resolving deltas: 100% (5/5), completed with 5 local objects.
To github.com:simbo/docker-node.git
   62dbed0..7d66bbf  master -> master
 * [new tag]         14.15.3 -> 14.15.3

All done.
See GitHub Actions for CI details: https://github.com/simbo/docker-node/actions
See Docker Hub for released images: https://hub.docker.com/r/simbo/node/tags
```