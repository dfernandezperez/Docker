FROM bioconductor/release_core2


RUN apt-get update
RUN apt-get install -y curl wget libboost-all-dev libudunits2-dev

# Install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
RUN /opt/miniconda3/bin/conda config --add channels defaults
RUN /opt/miniconda3/bin/conda config --add channels conda-forge
RUN /opt/miniconda3/bin/conda config --add channels bioconda

# Install software required for rnaseq pipeline with bioconda
RUN /opt/miniconda3/bin/conda install -c bioconda samtools star preseq \
deeptools multiqc pysam bedops \
fastqc picard subread rseqc gffutils samblaster kallisto

# Install fastp manually because bioconda verison is not the latest
RUN wget http://opengene.org/fastp/fastp
RUN chmod a+x ./fastp
RUN mv ./fastp /usr/local/bin

# R packages and bioconductor
RUN R --slave -e "BiocManager::install(c('org.Mm.eg.db', 'org.Hs.eg.db', 'DESeq2', 'clusterProfiler', 'pcaExplorer', 'ReactomePA', 'IHW', 'apeglm', 'tximport', 'rhdf5'))" 

RUN R --slave -e 'install.packages(c("data.table", "RColorBrewer", "devtools", "tidyverse", "tibble", "openxlsx"), repos="https://cloud.r-project.org/")'

# Update path
ENV PATH "/opt/miniconda3/bin:$PATH"
ENV PATH "/usr/local/bin:$PATH"
