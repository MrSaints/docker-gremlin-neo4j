#!/bin/bash

docker build --rm \
    --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
    --build-arg VCS_REF=`git rev-parse --short HEAD` \
    -f gremlin-server-neo4j/Dockerfile \
    -t mrsaints/gremlin-server-neo4j \
    ./gremlin-server-neo4j/