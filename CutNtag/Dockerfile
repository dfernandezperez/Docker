FROM bioconductor/bioconductor_docker

RUN apt-get update \
&& apt-get install -y \
curl \
wget \
libboost-all-dev \
libudunits2-dev \
gawk

# Install miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
&& bash Miniconda2-latest-Linux-x86_64.sh -b -p /opt/miniconda2 \
&& /opt/miniconda2/bin/conda config --add channels bioconda \
&& /opt/miniconda2/bin/conda config --add channels defaults \
&& /opt/miniconda2/bin/conda config --add channels conda-forge

# Install software required for chipseq pipeline with bioconda
# Force version of samtools to avoid error https://github.com/bioconda/bioconda-recipes/issues/13958
RUN /opt/miniconda2/bin/conda install -c bioconda samtools \
&& /opt/miniconda2/bin/conda install -c bioconda bowtie2 \
&& /opt/miniconda2/bin/conda install -c bioconda macs2 \
&& /opt/miniconda2/bin/conda install -c bioconda preseq \
&& /opt/miniconda2/bin/conda install -c bioconda deeptools \
&& /opt/miniconda2/bin/conda install -c bioconda multiqc \
&& /opt/miniconda2/bin/conda install -c bioconda samblaster \
&& /opt/miniconda2/bin/conda install -c bioconda wiggletools \
&& /opt/miniconda2/bin/conda install -c bioconda pysam \
&& /opt/miniconda2/bin/conda install -c bioconda bedops \
&& /opt/miniconda2/bin/conda install -c bioconda r-spp \
&& /opt/miniconda2/bin/conda install -c bioconda ucsc-bedgraphtobigwig \
&& /opt/miniconda2/bin/conda install -c bioconda fastqc \
&& /opt/miniconda2/bin/conda install -c bioconda picard

# Install fastp manually because bioconda verison is not the latest
RUN wget http://opengene.org/fastp/fastp \
&& chmod a+x ./fastp \
&& mv ./fastp /usr/local/bin

# Download peak caller for cutntag/run SEACR
RUN git clone https://github.com/FredHutch/SEACR

# bioconductor
RUN R --slave -e "BiocManager::install(c( \
        'org.Mm.eg.db', \
        'org.Hs.eg.db', \
        'TxDb.Mmusculus.UCSC.mm9.knownGene', \
        'TxDb.Mmusculus.UCSC.mm10.knownGene', \
        'TxDb.Hsapiens.UCSC.hg38.knownGene', \
        'TxDb.Hsapiens.UCSC.hg19.knownGene', \
        'ChIPseeker'))" 

# cran
RUN R --slave -e 'install.packages(c( \
        "data.table", \
        "ggplot2", \
        "RColorBrewer", \
        "devtools", \
        "spp"), \
        repos="https://cloud.r-project.org/")'

# Update path
ENV PATH "/opt/miniconda2/bin:$PATH"
ENV PATH "/usr/local/bin:$PATH"
ENV PATH "/SEACR:$PATH"