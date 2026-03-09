#!/bin/bash
docker pull maven:3.9-eclipse-temurin-21-jammy
docker build --platform linux/amd64 -t ghcr.io/elexis/docker-build:2025-03-java21 -f Dockerfile-build .
docker push ghcr.io/elexis/docker-build:2025-03-java21
