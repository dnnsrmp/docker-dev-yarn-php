#!/usr/bin/env bash

docker build . -t dnnsrmp/dev-yarn-php:latest
docker push dnnsrmp/dev-yarn-php:7.3
docker push dnnsrmp/dev-yarn-php:latest