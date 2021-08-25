# Use Alpine latest image as base
FROM alpine:latest

# Arguments
ARG PACKER_VER=1.7.2

# Prereqs
RUN apk --no-cache add git

# Download packer from Hashicorp
RUN wget -O /tmp/packer.zip \
    "https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_amd64.zip" \
  && unzip -o /tmp/packer.zip -d /usr/local/bin \
  && rm -f /tmp/packer.zip

# Run packer and output version
RUN /usr/local/bin/packer --version

# Run git and output version
RUN git --version

# Set entry point
ENTRYPOINT ["packer"]
