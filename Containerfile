FROM docker.io/redhat/ubi9-minimal:latest AS toolchain

# Copy Bash configuration
COPY bashrc /root/.bashrc

RUN microdnf update -y \
 && microdnf install -y git \
                        cargo \
                        tar \
 && dnf clean all \
 && rm -rf /var/cache/dnf /var/tmp/* /tmp/*

# Copy Bash configuration
COPY bashrc /root/.bashrc

###############################################################

FROM toolchain AS builder

WORKDIR /build
COPY --parents Cargo.toml Cargo.lock src/ ./
RUN mkdir /install/ \
 && cargo install --bins --path . --root /install/ \
 && rm -rf target/

###############################################################

FROM docker.io/redhat/ubi9-minimal:latest

COPY --from=builder /install/* /usr/local/bin
