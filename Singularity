Bootstrap: docker
From: bioconductor/release_core2

%environment
export PATH="/opt/miniconda2/bin:$PATH"

%runscript

   #"I can put here whatever I want to happen by default when the user runs the container"
   cat << EOF
To execute a binary inside the container do "singularity exec /path/to/container.img binary-name"
EOF

%post

	echo "Here we are installing software and other dependencies for the container!"

	echo "Installing basic dependencies"
	apt-get update
	apt-get install -y curl wget libboost-all-dev libudunits2-dev
	
	# Install miniconda
	wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
	bash Miniconda2-latest-Linux-x86_64.sh -b -p /opt/miniconda2
	/opt/miniconda2/bin/conda config --add channels defaults
	/opt/miniconda2/bin/conda config --add channels conda-forge
	/opt/miniconda2/bin/conda config --add channels bioconda
	
	# Install software required for chipseq pipeline with bioconda
	/opt/miniconda2/bin/conda install -c bioconda samtools=1.9 bowtie=1.2.2 fastqc=0.11.7 macs2=2.1.1.20160309 \
	deeptools=3.1.1 multiqc=1.6a0 samblaster=0.1.24 wiggletools=1.2.2 pysam=0.15.0.1
	
	# Install fastp manually because bioconda verison is not the latest
	wget http://opengene.org/fastp/fastp
	chmod a+x ./fastp
	mv ./fastp /usr/local/bin
	
	# Install bedgraph to bigwig from ucsc
	wget http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedGraphToBigWig
	chmod a+x ./bedGraphToBigWig
	mv ./bedGraphToBigWig /usr/local/bin
	# R packages and bioconductor
	R --slave -e "source('https://bioconductor.org/biocLite.R'); \
                      biocLite(c('ChIPseeker', 'org.Mm.eg.db', 'TxDb.Mmusculus.UCSC.mm9.knownGene'))"                  
	R --slave -e 'install.packages(c("ggplot2", "data.table", "RColorBrewer", "devtools", "spp"), repos="https://cloud.r-project.org/")'