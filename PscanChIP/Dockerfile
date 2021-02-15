FROM ubuntu:18.04

RUN apt-get update --yes && \
  apt-get upgrade --yes && \
  apt install --yes \
  wget \
  g++ \
  libgsl-dev

RUN wget http://159.149.160.88/pscan_chip_dev/Source/Pscan_ChIP.tar.gz && \
tar -xvf Pscan_ChIP.tar.gz && \
cd Pscan_ChIP && \
g++ pscan_chip.cpp -o pscan_chip -O3 -lgsl -lgslcblas && \
wget http://159.149.160.88/pscan_chip_dev/Source/hg38.tar.gz && \
wget http://159.149.160.88/pscan_chip_dev/Source/mm10.tar.gz && \
tar -xvf hg38.tar.gz  && \
tar -xvf mm10.tar.gz

RUN cd Pscan_ChIP && \
rm mm10.tar.gz hg38.tar.gz && \
mv * .. && \
cd .. && \
rm -rf Pscan_ChIP.tar.gz Pscan_ChIP/