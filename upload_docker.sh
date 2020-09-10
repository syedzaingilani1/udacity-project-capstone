#!/usr/bin/env bash

# docker path
dockerpath=talha110/project-capstone

# Step 2:
# Authenticate & tag
docker login --username talha110
echo "Docker ID and Image: $dockerpath"

docker tag talha110/project-capstone talha110/project-capstone:v1

docker push talha110/project-capstone:latest
