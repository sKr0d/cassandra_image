#!/bin/bash
#

name="ghcr.io/skr0d/cassandra_image"
tag="4.1.8e"

# BUILD IAMGES
docker build -t ${name}-amd64:${tag} \
	--platform linux/amd64 .

docker build -t ${name}-arm64:${tag} \
	--platform linux/arm64/v8 .

# PUSH IMAGES
docker push ${name}-amd64:${tag}
docker push ${name}-arm64:${tag}

# CREATE MANIFEST
docker manifest create ${name}-multi:${tag} \
	${name}-amd64:${tag} \
	${name}-arm64:${tag}

# PUSH MANIFEST
docker manifest push ${name}-multi:${tag}

