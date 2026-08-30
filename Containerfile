FROM docker.io/redhat/ubi9-minimal:latest AS toolchain

# Copy Bash configuration
COPY bashrc /root/.bashrc

RUN microdnf update -y \
 && microdnf install -y git \
                        cargo \
                        tar

# Copy Bash configuration
COPY bashrc /root/.bashrc
