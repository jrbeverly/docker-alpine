FROM alpine:3.5
MAINTAINER jrbeverly

# Build Arguments
#
# Arguments used in the build process of the docker container.

# Environment Variables
#
# Environment variables present in the docker container.
ENV S6_OVERLAY_VERSION=v1.18.1.5

# Metadata 
#
# The metadata of the image.
LABEL app="Alpine Base Image"
LABEL description="A docker image configured to handle small docker containers."
LABEL version="0.1"

# Provision
#
# Copy and execute provisioning scripts of the docker container.
RUN apk add --no-cache bash

COPY provision/install /tmp/install
RUN chmod +x /tmp/install; sync; bash /tmp/install 

COPY rootfs/ /

RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

# Ports
#
# Ports exposed by the docker container

# Volumes
#
# Volumes exposed by the docker container

# Options
#
# Configuration options of the docker container
ENTRYPOINT ["/init"]
CMD []