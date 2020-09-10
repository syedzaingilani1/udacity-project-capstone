#!/usr/bin/env bash

# docker path
dockerpath=talha110/talha-project-capstone

echo "Docker ID and Image: $dockerpath"

docker tag talha110/talha-project-capstone talha110/talha-project-capstone:v1

docker push talha110/talha-project-capstone
