#!/bin/bash

docker build --rm \
    --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
    --build-arg VCS_REF=`git rev-parse --short HEAD` \
    -f gremlin-console-neo4j/Dockerfile \
    -t mrsaints/gremlin-console-neo4j \
    ./gremlin-console-neo4j/