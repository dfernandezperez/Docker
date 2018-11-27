FROM bioconductor/release_core2

# Basic dependencies for Seurat and most R packages
RUN apt-get install -y apt-transport-https apt-utils software-properties-common
RUN apt-get install -y curl wget nano libboost-all-dev libudunits2-dev gawk
RUN apt-get install -y libblas3 libblas-dev liblapack-dev liblapack3 curl
RUN apt-get install -y gcc fort77 aptitude
RUN apt-get install -y g++
RUN apt-get install -y xorg-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y gfortran
RUN apt-get install -y libssl-dev libxml2-dev libpcre3-dev liblzma-dev libbz2-dev libcurl4-openssl-dev 
RUN apt-get install -y libhdf5-dev hdf5-helpers libmariadb-client-lgpl-dev python-pip  python-virtualenv

# Dependencies for rgl package
RUN apt-get install -y xorg libglu1-mesa-dev libx11-dev libfreetype6-dev

# Dependencies for umap and monocle
RUN pip install umap-learn 
RUN pip install louvain

# installing packages from cran
RUN R --slave -e 'install.packages("devtools",repos="https://cran.rstudio.com/")'
RUN R --slave -e 'install.packages("dplyr",repos="https://cran.rstudio.com/")'
RUN R --slave -e 'install.packages("Seurat",repos="https://cran.rstudio.com/")'
RUN R --slave -e 'install.packages("reticulate",repos="https://cran.rstudio.com/")'
RUN R --slave -e 'install.packages("rgl",repos="https://cran.rstudio.com/")'
RUN R --slave -e 'install.packages("shinythemes",repos="https://cran.rstudio.com/")'

# installing from bioc
RUN R --slave -e 'source("https://bioconductor.org/biocLite.R"); biocLite("monocle")'
RUN R --slave -e 'source("https://bioconductor.org/biocLite.R"); biocLite("scran")'
RUN R --slave -e 'devtools::install_github("cole-trapnell-lab/DDRTree", ref="simple-ppt-like")'
RUN R --slave -e 'devtools::install_github("cole-trapnell-lab/L1-graph")'
RUN R --slave -e 'source("http://cf.10xgenomics.com/supp/cell-exp/rkit-install-2.0.0.R")'

# Some monocle3 dependencies
RUN R --slave -e 'source("https://bioconductor.org/biocLite.R"); biocLite("DelayedMatrixStats")'
RUN R --slave -e 'install.packages(c("spdep", "glmnet", "doParallel", "pbmcapply"))'
# To install monocle3 alpha we need to downgrade the VGAM package until they fix a bug
RUN wget https://cran.r-project.org/src/contrib/Archive/VGAM/VGAM_1.0-5.tar.gz
RUN R --slave -e 'install.packages("VGAM_1.0-5.tar.gz", source = FALASE)'
RUN R --slave -e 'library(monocle);devtools::install_github("cole-trapnell-lab/monocle-release", ref="monocle3_alpha", dependencies = FALSE)'

RUN R --slave -e 'devtools::install_github("ggjlab/scMCA")'
