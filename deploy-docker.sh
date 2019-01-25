#!/usr/bin/env bash

set -e

REPO = openpitrix/dashboard-env-slim

echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin

docker build -t $REPO:$COMMIT .

docker push $REPO