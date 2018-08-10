FROM qnib/uplain-init:xenial-20180726_2018-08-10_18-27

ENV DEBIAN_FRONTEND=noninteractive
ENV NV_CUDA_VER=8.0
ARG NV_URL=https://developer.nvidia.com/compute/cuda
RUN apt-get update \
 && apt-get install -y wget
RUN echo ">> Download: ${NV_URL}/${NV_CUDA_VER}/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb" \
 && wget -qO /tmp/cuda-repo.deb ${NV_URL}/${NV_CUDA_VER}/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb \
 && dpkg -i /tmp/cuda-repo.deb \
 && rm -f /tmp/cuda-repo.deb
RUN echo ">> Download: ${NV_URL}/${NV_CUDA_VER}/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb" \
 && wget -qO /tmp/cuda-blas-update.deb ${NV_URL}/${NV_CUDA_VER}/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb \
 && dpkg -i /tmp/cuda-blas-update.deb \
 && rm -f /tmp/cuda-blas-update.deb
RUN apt-get update \
 && apt-get install -y cuda
