# syntax=docker/dockerfile:1.10
# hadolint global ignore=DL3008
ARG UBUNTU_VERSION=16.04
ARG CUDA_VERSION=8.0
ARG CUDA_KEYRING_VERSION=1.0

# Force the base base image to avoid issues with GLIBC and gcc
FROM ubuntu:22.04

ARG UBUNTU_VERSION
ARG CUDA_VERSION
ARG CUDA_KEYRING_VERSION

LABEL maintainer="bendabir"
LABEL org.opencontainers.image.source="https://github.com/bendabir/cuda"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends wget apt-transport-https ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Setup repositories for CUDA Toolkit
RUN wget -q -nv "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu${UBUNTU_VERSION//\./}/x86_64/cuda-keyring_${CUDA_KEYRING_VERSION}-1_all.deb" \
    && dpkg -i "cuda-keyring_${CUDA_KEYRING_VERSION}-1_all.deb" \
    && rm "cuda-keyring_${CUDA_KEYRING_VERSION}-1_all.deb"

# Install the CUDA compiler
# It seems that we don't really need more to build PyTorch extensions
RUN apt-get update \
    && apt-get install -y --no-install-recommends cuda-compiler-${CUDA_VERSION//\./-} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV CUDA_HOME="/usr/local/cuda-${CUDA_VERSION}"
