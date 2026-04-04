#!/usr/bin/env bash
# vim: ai:ts=8:sw=8:noet
set -euo pipefail

# renovate: datasource=docker depName=trufflesecurity/trufflehog
TRUFFLEHOG_DEFAULT_VERSION="3.94.2@sha256:dabd9a5f78ed81211792afc39a35100e2b947baa9f43f1e73a97759d7d15ab86"
TRUFFLEHOG_VERSION="${TRUFFLEHOG_VERSION:-${TRUFFLEHOG_DEFAULT_VERSION}}"

docker \
    run \
    --volume "$(pwd):/workdir" \
    --interactive \
    --rm \
    "trufflesecurity/trufflehog:$TRUFFLEHOG_VERSION" \
    git \
    file:///workdir \
    --since-commit HEAD \
    --results=verified,unknown \
    --fail