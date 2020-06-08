#!/usr/bin/env bash

set -euxo pipefail
export SHA=$(git log -1 --format=%h)

docker build -f Docker/Dockerfile.release -t presto:$SHA .

# Source common testing functions
. Docker/container-test.sh

test_container "presto:$SHA"
