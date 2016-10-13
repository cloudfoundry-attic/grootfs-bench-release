#!/bin/bash

VERSION=$(cat grootfs-bench-release-version/number)

pushd grootfs-release-develop
  bosh create release --force --version $VERSION --with-tarball --name grootfs-bench
popd

mv grootfs-bench-release/dev_releases/grootfs-bench/grootfs-bench-*.tgz bosh-release/
