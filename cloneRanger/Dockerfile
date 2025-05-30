FROM rocker/rstudio:4.5.0

#--------------------------  Install Seurat's system dependencies
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get --quiet update --yes \
    && apt-get --quiet upgrade --yes \
    && apt-get --quiet install --yes  \
    libhdf5-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libpng-dev \
    libboost-all-dev \
    libxml2-dev \
    openjdk-8-jdk \
    python3-dev \
    python3-pip \
    python3-venv \
    wget \
    git \
    libfftw3-dev \
    libgsl-dev \
    pkg-config

#--------------------------  Install UMAP, pandas and biopython
ENV PATH="/opt/venv/bin:$PATH"
RUN python3 -m venv /opt/venv && pip3 install numpy umap-learn biopython pandas

#--------------------------  Install bioconductor dependencies
RUN R --no-echo --no-restore --no-save -e "install.packages('BiocManager')" \
    && R --no-echo --no-restore --no-save -e "BiocManager::install(c('scDblFinder', 'SingleCellExperiment', 'DropletUtils'))"

#--------------------------  Install cran packages
RUN R --no-echo --no-restore --no-save -e "install.packages(c('tidyverse', 'glue'))" \
    && R --no-echo --no-restore --no-save -e "install.packages('Matrix')" \
    && R --no-echo --no-restore --no-save -e "install.packages('remotes')" \
    && R --no-echo --no-restore --no-save -e "install.packages('Seurat')" \
    && R --no-echo --no-restore --no-save -e "install.packages('Signac')" \
    && R --no-echo --no-restore --no-save -e "remotes::install_github('mojaveazure/seurat-disk')"