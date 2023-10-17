#!/bin/bash
docker pull maven:3.8.7-eclipse-temurin-17-focal
docker build --platform linux/amd64 -t gitlab.medelexis.ch:4567/elexis/docker-build:2022-09-java17 -f Dockerfile-build .
docker push gitlab.medelexis.ch:4567/elexis/docker-build:2022-09-java17