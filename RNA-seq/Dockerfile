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
# Force version of samtools to avoid error https://github.com/bioconda/bioconda-recipes/issues/13958
RUN /opt/miniconda3/bin/conda install -c bioconda \
samtools=1.10 \
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


# Install R packages
COPY *.R .
RUN Rscript install_packages_cranDev.R
RUN Rscript install_packages_bioc.R


# Update path
ENV PATH "/opt/miniconda3/bin:$PATH"
ENV PATH "/usr/local/bin:$PATH"
