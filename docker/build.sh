#!/bin/bash -e

[ -n "$VERBOSE" ] && ARGS="--progress plain"

(
  cd base-image &&
  docker build $ARGS -t ghcr.io/collabora/whisperbot-base:latest .
)

mkdir -p scratch-space
cp -r scripts/build-* scratch-space
#docker run --gpus all --shm-size 64G -v "$PWD"/scratch-space:/root/scratch-space -w /root/scratch-space -it ghcr.io/collabora/whisperbot-base:latest ./build-models.sh

docker build $ARGS -t ghcr.io/collabora/whisperbot:latest .
