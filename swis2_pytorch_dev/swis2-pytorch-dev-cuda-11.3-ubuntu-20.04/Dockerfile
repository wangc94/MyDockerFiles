# syntax=docker/dockerfile:1
FROM nvidia/cuda:11.3.1-base-ubuntu20.04

LABEL org.opencontainers.image.authors="Wang Cong" \
      org.opencontainers.image.email="wangc1994@outlook.com"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
# Install some basic utilities
RUN apt-get update 
RUN apt-get install -y \
    curl \
    sudo \
    ca-certificates \
    git \
    bzip2
RUN rm -rf /var/lib/apt/lists/* \
# Create a working directory
RUN mkdir /swis2
WORKDIR /swis2
ENV HOME=/root
# # Set up the Conda environment (using Miniforge)
ENV PATH=$HOME/mambaforge/bin:$PATH
COPY environment.yml /swis2/environment.yml
RUN curl -sLo /swis2/mambaforge.sh https://github.com/conda-forge/miniforge/releases/download/4.12.0-2/Mambaforge-4.12.0-2-Linux-x86_64.sh 
RUN chmod +x /swis2/mambaforge.sh \
    && /swis2/mambaforge.sh -b \
    && rm /swis2/mambaforge.sh
RUN mamba env update -n base -f /swis2/environment.yml \
    && rm /swis2/environment.yml \
    && mamba clean -ya
# Set up Jupyter Lab Config
COPY ./.jupyter $HOME/.jupyter
# jupyter port
EXPOSE 8888-8900
#
CMD    ["/bin/bash"]