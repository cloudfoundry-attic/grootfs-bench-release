#!/bin/bash
git config --global user.email "cf-garden+garden-gnome@pivotal.io"
git config --global user.name "I am Groot CI"

pushd grootfs-git-repo
  head=$(git rev-parse HEAD)
popd

pushd grootfs-bench-release/src/code.cloudfoundry.org/grootfs-bench
  git fetch
  git reset --hard $head
popd

pushd grootfs-bench-release
  git add src/code.cloudfoundry.org/grootfs-bench
  grootfs_changes=$(git diff --cached --submodule src/code.cloudfoundry.org/grootfs-bench | tail -n +2)
  git commit -m "$(printf "Bump grootfs-bench\n\n${grootfs_changes}")"
  git submodule update --init --recursive
popd

cp -r grootfs-bench-release/. bumped-release-git
