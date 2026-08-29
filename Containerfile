FROM docker.io/redhat/ubi9-minimal:latest

RUN microdnf update -y \
 && microdnf install -y git \
                        openssh-clients \
                        cargo

