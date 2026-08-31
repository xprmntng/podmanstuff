#!/usr/bin/env bash

cwd_name=$(basename $(pwd))

podman run -it \
           --init \
           --workdir /root/workspace \
           --volume ~/.ssh/id_rsa:/root/.ssh/id_rsa:z,ro \
           --volume ~/.ssh/known_hosts:/root/.ssh/known_hosts:z,ro \
           --volume .:/root/workspace:Z \
           --volume ~/.cargo/credentials.toml:/root/.cargo/credentials.toml:z,ro \
           --volume ~/.gitconfig:/root/.gitconfig:z,ro \
           --mount source=global-cargo-registry-cache,target=/root/.cargo/registry,type=volume \
           --mount source=global-cargo-git-cache,target=/root/.cargo/git,type=volume \
           --mount source=local-cargo-target-cache-"$cwd_name",target=/root/workspace/target,type=volume \
           --env CARGO_HOME=/root/.cargo \
           -- rust-toolchain bash
