#!/usr/bin/env bash

set -euxo pipefail

PRESTO_VERSION=$(./mvnw --quiet help:evaluate -Dexpression=project.version -DforceStdout)

docker build -f Docker/Dockerfile --build-arg "PRESTO_VERSION=${PRESTO_VERSION}" -t "presto:${PRESTO_VERSION}" .

# Source common testing functions
. Docker/container-test.sh

test_container "presto:${PRESTO_VERSION}"
