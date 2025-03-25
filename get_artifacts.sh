#!/bin/bash

# Get all container IDs with "act-build" in their name
buildIds=$(docker ps -aqf "name=act-build")

# Create local artifacts directory if it doesn't exist
mkdir -p ./artifacts

# Process each container
for id in $buildIds; do
    # Execute command in container to collect artifacts
    docker exec $id bash -c "mkdir -p /artifact; cp -f /tmp/tmp.*/artifacts/* /artifact"
    
    # Copy artifacts from container to local directory
    docker cp $id:artifact/. ./artifacts
done