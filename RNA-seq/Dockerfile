apt-get update
apt-get install -y curl wget libboost-all-dev libudunits2-dev

# Install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
/opt/miniconda3/bin/conda config --add channels defaults
/opt/miniconda3/bin/conda config --add channels conda-forge
/opt/miniconda3/bin/conda config --add channels bioconda

# Install software required for chipseq pipeline with bioconda
/opt/miniconda3/bin/conda install -c bioconda samtools=1.9 star=2.7.0e-0 preseq=2.0.3 \
deeptools=3.1.1 multiqc=1.6a0 pysam=0.15.0.1 bedops=2.4.35 \
fastqc=0.11.8 picard=2.18.7 subread=1.6.4 rseqc=3.0.0

# Install fastp manually because bioconda verison is not the latest
wget http://opengene.org/fastp/fastp
chmod a+x ./fastp
mv ./fastp /usr/local/bin

# R packages and bioconductor
R --slave -e "source('https://bioconductor.org/biocLite.R'); \
                    biocLite(c('org.Mm.eg.db', 'org.Hs.eg.db', 'DESeq2', 'clusterProfiler', 'pcaExplorer'))" 

R --slave -e 'install.packages(c("data.table", "RColorBrewer", "devtools", "tidyverse", "tibble", "openxlsx", "rJava"), repos="https://cloud.r-project.org/")'

# Update path
export PATH="/opt/miniconda3/bin:$PATH"
export PATH=/usr/local/bin:$PATH
