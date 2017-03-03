#!/bin/bash

VERSION=$(cat grootfs-bench-release-version/number)
BUILD_FOLDER=$PWD

pushd grootfs-bench-release
  bosh2 create-release --force --version $VERSION --tarball $BUILD_FOLDER/bosh-release/grootfs-bench-$VERSION.tgz --name grootfs-bench
popd
