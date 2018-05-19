#!/bin/bash

# exit on errors
set -e

# semver version to release
VERSION=$1

# test cli param and print usage information
if [[ ! "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Upgrade node.js version and release new images."
  echo "Usage: $0 <SEMVER_VERSION>"
  echo "Example: $0 8.11.2"
  exit 1
fi

# change to script directory
cd "$(dirname "$0")"

# test if git is available
command -v git >/dev/null 2>&1 || { echo >&2 "git is required but not available.  Aborting."; exit 1; }

# test if current branch is master
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$CURRENT_BRANCH" != "master" ]]; then
  echo "Your current git branch should be master but is $CURRENT_BRANCH.  Aborting."
  exit 1
fi

# test if working tree is clean
if REPO_STATUS=$(git status --untracked-files=no --porcelain) && [ ! -z "$REPO_STATUS" ]; then
  echo "Your git repository seems to have uncommitted changes.  Aborting."
  exit 1
fi

# extract major and minor parts from version for confirmation message
VERSION_MAJOR=`echo "$VERSION" | sed -E 's/^([0-9]+).+$/\1/'`
VERSION_MINOR=`echo "$VERSION" | sed -E 's/^([0-9]+\.[0-9]+).+$/\1/'`

# confirm actions
echo "This script will update all dockerfiles in this repository to node.js version $VERSION."
echo "Changes will be committed, tagged with $VERSION and pushed to GitHub."
echo "That should trigger Travis CI, where images will be built and released to Docker Hub tagged with $VERSION_MAJOR, $VERSION_MINOR and $VERSION."
read -p "Do you want to continue? (y/n) " -n 1 -r CONFIRM
echo ""
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
  echo "Cancelled."
  exit 1
fi
echo ""

# message for committing and tagging
MESSAGE="node.js v$VERSION"

# files list
declare -a FILES=(
  "Dockerfile"
  "Dockerfile-slim"
  "Dockerfile-gyp"
  "Dockerfile-alpine"
)

# change files and add changes to git
for FILE in "${FILES[@]}"; do
  sed -i '' -E 's/^(FROM[[:space:]]+)(simbo\/)?(node:)([0-9]+\.[0-9]+\.[0-9]+)/\1\2\3'$VERSION'/' $FILE
  git add $FILE
done

# commit changes
git commit -m "$MESSAGE"

# remove tag if existing locally and remote, then add new tag
set +e
git tag -d $VERSION >/dev/null 2>&1
git push origin :refs/tags/$VERSION >/dev/null 2>&1
git push --delete origin $VERSION >/dev/null 2>&1
set -e
git tag -a $VERSION -m "$MESSAGE"

# push changes and tags
git push --tags origin master

# print success message
echo ""
echo "All done."
echo "See Travis CI for further actions: https://travis-ci.org/simbo/docker-node/builds"
exit 0
