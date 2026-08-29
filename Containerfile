FROM docker.io/redhat/ubi9-minimal:latest

# Remove unneeded directory
RUN rm -rf /root/buildinfo

RUN microdnf update -y \
 && microdnf install -y git \
                        cargo \
                        tar

# Copy Bash configuration
COPY bashrc /root/.bashrc
