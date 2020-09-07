#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
export dockerpath=talha110/talha-project-capstone 

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login --username talha110
docker tag talha-project-capstone  $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath
