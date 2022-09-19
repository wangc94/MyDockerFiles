# syntax=docker/dockerfile:1
FROM nvidia/cuda:11.6.2-base-ubuntu20.04

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
RUN apt-get install -y vim --fix-missing
RUN rm -rf /var/lib/apt/lists/*
# Create a working directory
RUN mkdir /work
WORKDIR /work
ENV HOME=/root
# # Set up the Conda environment (using Miniforge)
ENV PATH=$HOME/mambaforge/bin:$PATH
COPY environment.yml /work/environment.yml
RUN curl -sLo /work/mambaforge.sh https://github.com/conda-forge/miniforge/releases/download/4.12.0-2/Mambaforge-4.12.0-2-Linux-x86_64.sh 
RUN chmod +x /work/mambaforge.sh \
    && /work/mambaforge.sh -b \
    && rm /work/mambaforge.sh
RUN mamba env update -n base -f /work/environment.yml \
    && rm /work/environment.yml \
    && mamba clean -ya
# Set up Jupyter Lab Config
COPY ./.jupyter $HOME/.jupyter
COPY ./*.tt? /usr/local/share/fonts/
RUN fc-cache -f -v
# jupyter port
EXPOSE 8888-8900
#
CMD    ["/bin/bash"]