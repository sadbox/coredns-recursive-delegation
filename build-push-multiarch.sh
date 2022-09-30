#!/bin/bash
docker buildx build --push --platform linux/arm64,linux/amd64 -t sadbox/coredns-troubleshooting .
docker buildx stop
