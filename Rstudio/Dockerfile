FROM rocker/rstudio:4.4.2

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

##----------------------------------------------------------------------------##
##
##----------------------------------------------------------------------------##
COPY Makevars /root/.R/
COPY ccache.conf /root/.ccache/

##----------------------------------------------------------------------------##
## update and install system packages
##
## libcurl4-openssl-dev                   curl and RCurl (R package)
## libssl-dev                             openssl (R package)
## libcairo2-dev, libxt-dev               Cairo (R package)
## libxml2-dev                            XML and xml2 (R package)
## libudunits2-dev                        units (R package)
## libhdf5-dev                            hdf5r (R package)
## libv8-dev                              V8 (R package)
## libgdal-dev                            rgdal (R package)
## xorg, libx11-dev, libglu1-mesa-dev     Monocle 3 (R package)
## samtools libboost-all-dev              velocyto (R package)
## libgsl-dev                             gsl -> slingshot (R package)
## libbz2-dev                             Rsamtools (R package)
## libfftw3-dev                           heatmaps (R package)
## libglpk-dev                            FlowSOM (R package)
## libpoppler-cpp-dev                     pdftools (R package)
## libgit2-dev                             git2r (R package)
## pandoc                                 quarto 
##----------------------------------------------------------------------------##
RUN apt-get --quiet update --yes \
  && apt-get --quiet upgrade --yes \
  && apt-get --quiet install --yes  \
    # python-dev \
    # python-pip \
    # python3-dev \
    # python3-pip \
    # python3-tk \
    pandoc \
    libcurl4-openssl-dev \
    libssl-dev \
    libcairo2-dev \
    libxt-dev \
    libxml2-dev \
    libudunits2-dev \
    libhdf5-dev \
    libv8-dev \
    libgdal-dev \
    libglpk-dev \
    xorg \
    libx11-dev \
    libglu1-mesa-dev \
    libboost-all-dev \
    libgsl-dev \
    libbz2-dev \
    less \
    libmagick++-dev \
    ccache \
    libfftw3-dev \
    mysql-server \
    libgit2-dev \
  && rm -rf /var/lib/apt/lists/*

##----------------------------------------------------------------------------##
## install conda
##----------------------------------------------------------------------------##
RUN cd / \
  && wget --quiet https://github.com/conda-forge/miniforge/releases/download/24.11.2-1/Miniforge3-24.11.2-1-Linux-x86_64.sh \
  && bash Miniforge3-24.11.2-1-Linux-x86_64.sh -b -p /miniconda3
ENV PATH "$PATH:/miniconda3/bin"

##----------------------------------------------------------------------------##
## make Python 3.12 default because velocyto requires at least Python 3.6
## - set 'python' command to call Python 2.7
## - set 'python3' command to call Python 3.12
## - rm lsb_release because it prevents pip3 from working properly
##----------------------------------------------------------------------------##
RUN update-alternatives --install /usr/bin/python3 python3 /miniconda3/bin/python3.12 2 \
  && python --version \
  && python3 --version \
  && rm /usr/bin/lsb_release

##----------------------------------------------------------------------------##
## install conda packages
##----------------------------------------------------------------------------##
RUN conda install --quiet --yes -c bioconda \
  bedtools \
  deeptools \
  samtools \
  && conda install --quiet --yes -c plotly plotly-orca

##----------------------------------------------------------------------------##
## install Python packages
##
## - velocyto is installed in a second run because it doesn't automatically
##   install its dependencies before
## - similarly, scvelo requires velocyto
## umap-learn                  UMAP
## louvain                     Monocle 3 and scanpy
## phate                       Seurat
## tensorflow, dca             DCA
## python-igraph, fa2, scanpy  scanpy
## leidenalg                   Leiden algorithm for clustering in Seurat v3
## numpy scipy cython numba
## matplotlib scikit-learn
## h5py click pysam velocyto   velocyto
## scvelo                      scVelo
## jupyter                     jupyter
## radian                      r terminal
##----------------------------------------------------------------------------##
RUN python3 -m pip install \
  click \
  Cython \
  dca \
  # fa2 \
  # "gast==0.2.2" \
  h5py \
  igraph \
  leidenalg \
  numba \
  numpy \
  # "networkx==2.2" \
  numpydoc \
  #"matplotlib>=3.0,<3.1" \
  pandas \
  phate \
  pysam \
  python-igraph \
  scanpy \
  scikit-learn \
  scipy \
  snaptools \
  tensorflow \
  umap-learn \
  jupyter \
  radian

RUN python3 -m pip install \
  velocyto \
  scvelo


##----------------------------------------------------------------------------##
## install R packages
## Copy every file individually to ensure that each step’s build cache is only 
## invalidated (forcing the step to be re-run) if the specifically required 
## files change.
##----------------------------------------------------------------------------##
# Install bwtool for trackplot R package
RUN git clone 'https://github.com/CRG-Barcelona/bwtool' \
&& git clone 'https://github.com/CRG-Barcelona/libbeato' \
&& git clone https://github.com/madler/zlib \
&& cd zlib \
&& ./configure --prefix=$HOME \
&& make \
&& cd .. \
&& cd libbeato \
&& git checkout 0c30432af9c7e1e09ba065ad3b2bc042baa54dc2 \
&& ./configure --prefix=$HOME \
&& make \
&& cd .. \
&& cd bwtool \
&& ./configure --prefix=$HOME CFLAGS='-I../libbeato -I../zlib' LDFLAGS='-L../libbeato/jkweb -L../libbeato/beato -L../zlib' \
&& make \
&& make install

RUN Rscript -e 'install.packages("BiocManager", repos = "http://cran.us.r-project.org")'

RUN mkdir /Rscripts
COPY install_packages_function.R /Rscripts/

COPY packages_utility.R /Rscripts/
RUN Rscript /Rscripts/packages_utility.R

COPY packages_plotting.R /Rscripts/
RUN Rscript /Rscripts/packages_plotting.R

COPY packages_compbio.R /Rscripts/
RUN Rscript /Rscripts/packages_compbio.R

COPY packages_single_cell.R /Rscripts/
RUN Rscript /Rscripts/packages_single_cell.R

COPY packages_single_cell_experimental.R /Rscripts/
RUN Rscript /Rscripts/packages_single_cell_experimental.R
