FROM bioconductor/bioconductor_docker

RUN apt-get update \
&& apt-get install -y \
curl \
wget \
libboost-all-dev \
libudunits2-dev \
mailutils

# Install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
&& bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 \
&& /opt/miniconda3/bin/conda config --add channels defaults \
&& /opt/miniconda3/bin/conda config --add channels conda-forge \
&& /opt/miniconda3/bin/conda config --add channels bioconda

# Install software required for rnaseq pipeline with bioconda
# Set salmon version manually because otherwise it installs 0.13.1
RUN /opt/miniconda3/bin/conda install -c bioconda \
samtools \
star \
preseq \
deeptools \
multiqc \
pysam \
bedops \
fastqc \
picard \
subread \
rseqc \
gffutils \
samblaster \
kallisto \
salmon=1.2.1

# Install fastp manually because bioconda verison is not the latest
RUN wget http://opengene.org/fastp/fastp \
&& chmod a+x ./fastp \
&& mv ./fastp /usr/local/bin

# bioconductor
RUN R --slave -e "BiocManager::install(c( \
        'org.Mm.eg.db', \
        'org.Hs.eg.db', \
        'DESeq2', \
        'clusterProfiler', \
        'pcaExplorer', \
        'ReactomePA', \
        'IHW', \
        'apeglm', \
        'tximport', \
        'rhdf5'))" 

# cran
RUN R --slave -e 'install.packages(c( \
        "data.table", \
        "RColorBrewer", \
        "devtools", \
        "tidyverse", \
        "tibble", \
        "openxlsx", \
        "msigdbr", \
        "ggforce"), \
        repos="https://cloud.r-project.org/")'

# devtools
RUN R --slave -e 'devtools::install_github(c( \
    "VPetukhov/ggrastr"))'


# Update path
ENV PATH "/opt/miniconda3/bin:$PATH"
ENV PATH "/usr/local/bin:$PATH"
