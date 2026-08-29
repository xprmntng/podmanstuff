#!/usr/bin/env bash

podman run -it \
           --init \
           --workdir /home/cargo/workspace \
           --volume ~/.ssh/id_rsa:/root/.ssh/id_rsa:Z,ro \
           --volume ./rusttest:/home/cargo/workspace:Z \
           --mount source=cargo-cache,target=/home/cargo/.cargo,type=volume \
           --mount source=target-cache,target=/home/cargo/workspace/target,type=volume \
           --env CARGO_HOME=/home/cargo/.cargo \
           --userns=keep-id \
           --user root \
           -- fun bash
