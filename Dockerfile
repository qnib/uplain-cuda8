FROM qnib/uplain-init:16.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
 && apt-get install -y wget
RUN wget -qO /tmp/cuda-repo.deb  https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb \
 && dpkg -i /tmp/cuda-repo.deb \
 && rm -f /tmp/cuda-repo.deb
RUN wget -qO /tmp/cuda-blas-update.deb https://developer.nvidia.com/compute/cuda/8.0/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb \
 && dpkg -i /tmp/cuda-blas-update.deb \
 && rm -f /tmp/cuda-blas-update.deb
RUN apt-get update \
 && apt-get install -y cuda
