#!/bin/bash
set -e

export GOPATH=$PWD/grootfs-bench-release
grootfs_path=grootfs-release-develop/src/code.cloudfoundry.org/grootfs
grootfs_bench_path=grootfs-bench-release/src/code.cloudfoundry.org/grootfs-bench

publish_event() {
  pushd $grootfs_path
    EVENT_TITLE=$(git log --oneline -n 1)
    EVENT_MESSAGE=$(git log -1 --pretty=%B)
  popd

  pushd $grootfs_bench_path
    glide up
    make

    ./grootfs-bench-reporter \
      --mode event \
      --eventTitle "$EVENT_TITLE" \
      --eventMessage "$EVENT_MESSAGE"
  popd
}

echo "Publishing datadog event..."
if [ ! -z $DATADOG_API_KEY ] && [ ! -z $DATADOG_APPLICATION_KEY ]; then
  publish_event
else
  echo "-----------------------------------------------"
  echo "No DATADOG key found. Skipping event publishing"
  echo "-----------------------------------------------"
fi

echo "Running performance tests..."
bosh target $BOSH_TARGET
bosh deployment $BOSH_MANIFEST
bosh run errand grootfs-bench-$FS_DRIVER
