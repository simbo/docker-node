docker-node
===========

> Docker images with node.js and some opinionated settings.

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/simbo/docker-node/CI)](https://github.com/simbo/docker-node/actions?query=workflow%3ACI)
[![Docker Pulls](https://img.shields.io/docker/pulls/simbo/node.svg)](https://hub.docker.com/r/simbo/node)


These images are derivates of the [official node images](https://hub.docker.com/_/node/)
with the following changes:

  - timezone set to "Europe/Berlin"
  - simple prompt with current path and docker image name
  - yarn self-update check disabled
  - nano installed and set as default editor

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

It is not recommended to use images with the tag `latest` as they refer to the
latest build and not necessarily to the latest version.

See the [tags list](https://hub.docker.com/r/simbo/node/tags/) for all available
image versions.

## Development

### Local Builds for Testing

```sh
# build default image
docker build -f Dockerfile -t test-simbo/node .
# build slim image
docker build -f Dockerfile-slim -t test-simbo/node-slim .
# build gyp image
docker build -f Dockerfile-gyp -t test-simbo/node-gyp .
# build alpine image
docker build -f Dockerfile-alpine -t test-simbo/node-alpine .

# run default image with login shell
docker run --rm -it test-simbo/node bash
# run slim image with login shell
docker run --rm -it test-simbo/node-slim bash
# run gyp image with login shell
docker run --rm -it test-simbo/node-gyp bash
# run alpine image with login shell
docker run --rm -it test-simbo/node-alpine sh -l

# remove images afterwars
docker image rm test-simbo/node test-simbo/node-slim test-simbo/node-gyp test-simbo/node-alpine

# optionally: clear everything docker from your system
docker system prune -a
```

### Releasing new Versions

Use the release script `release-version` for automatically updating dockerfiles
and triggering new image releases using GitHub Actions and Docker Hub.

Usage: `./release-version <SEMVER_VERSION>`

Example: `./release-version 10.1.0`

Example output:

```txt
# ./release-version 10.23.0

📦 Publish new Versions for simbo/docker-node

This script will update all dockerfiles in this repository to

    node.js v10.23.0

Changes will be committed, tagged with 10.23.0 and pushed to GitHub.
This push should trigger GitHub Actions, where images will be built and released to Docker Hub, where they will be tagged with 10, 10.23 and 10.23.0.

Press [ENTER] to continue or anything else to cancel.

[master c012125] node.js v10.23.0
 4 files changed, 4 insertions(+), 4 deletions(-)
Objekte aufzählen: 25, fertig.
Zähle Objekte: 100% (25/25), fertig.
Delta-Kompression verwendet bis zu 4 Threads.
Komprimiere Objekte: 100% (19/19), fertig.
Schreibe Objekte: 100% (19/19), 2.23 KiB | 1.12 MiB/s, fertig.
Gesamt 19 (Delta 12), Wiederverwendet 0 (Delta 0), Pack wiederverwendet 0
remote: Resolving deltas: 100% (12/12), completed with 6 local objects.
To github.com:simbo/docker-node.git
   b498c44..c012125  master -> master
 * [new tag]         10.23.0 -> 10.23.0

✅ All done.

See GitHub Actions for CI details: https://github.com/simbo/docker-node/actions
See Docker Hub for released images: https://hub.docker.com/r/simbo/node/tags
```

## License and Author

[MIT &copy; Simon Lepel](http://simbo.mit-license.org/)
