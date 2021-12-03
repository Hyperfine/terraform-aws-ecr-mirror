#!/bin/bash

docker pull "$1"
aws ecr get-login-password --region "$2" | docker login --username AWS --password-stdin "$3.dkr.ecr.$2.amazonaws.com"
docker tag "$1" "$3.dkr.ecr.$2.amazonaws.com/$4:$5"
docker push "$3.dkr.ecr.$2.amazonaws.com/$4:$5"
