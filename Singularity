Bootstrap: docker
From: bioconductor/release_core2

%runscript

   #"I can put here whatever I want to happen by default when the user runs the container"
   cat << EOF
To execute a binary inside the container do "singularity exec /path/to/container.img binary-name"
EOF

%post

	echo "Here we are installing software and other dependencies for the container!"

	echo "Installing pip and basic dependencies"
	apt-get update
	apt-get install -y curl wget libboost-all-dev python-pip libudunits2-dev libncurses5-dev htslib
	
	# R packages and bioconductor
	R --slave -e "source('https://bioconductor.org/biocLite.R'); \
                      biocLite('ChIPseeker')"
 	R --slave -e "source('https://bioconductor.org/biocLite.R'); \
                      biocLite('TxDb.Mmusculus.UCSC.mm9.knownGene')"                     
	R --slave -e 'install.packages(c("ggplot2", "data.table", "RColorBrewer", "devtools", "snow"), repos="https://cloud.r-project.org/")'
	R --slave -e "library(devtools); \
	                  devtools::install_github('hms-dbmi/spp', build_vignettes = FALSE)"


	echo "Installing bowtie"
	wget https://sourceforge.net/projects/bowtie-bio/files/bowtie/1.2.2/bowtie-1.2.2-linux-x86_64.zip
	unzip bowtie-1.2.2-linux-x86_64.zip
	cp bowtie-1.2.2-linux-x86_64/bowtie /usr/local/bin

	echo "Installing samtools and samblaster"
	wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
	tar xvjf samtools-1.9.tar.bz2
	cd samtools-1.9
	./configure
	make
	make install
	cp samtools usr/local/bin
	cd ..
	git clone git://github.com/GregoryFaust/samblaster.git
	cd samblaster
	make
	cp samblaster /usr/local/bin/
	cd ..

	echo "Installing fastp for processing fastq files"
	wget http://opengene.org/fastp/fastp
	chmod a+x ./fastp
	cp fastp /usr/local/bin

	echo "Installing fastqc"
	wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
	unzip fastqc_v0.11.7.zip
	chmod a+x fastqc_v0.11.7/fastqc ; cp fastqc_v0.11.7/fastqc /usr/local/bin

	echo "Installing MACS2"
	pip install MACS2==2.1.1.20160309

	echo "Installing deeptools"
	pip install deepTools==3.1.1

	echo "Installing MultiQC"
	pip install multiqc==1.6

	echo "Installing weegletools and dependencies"
	git clone https://github.com/dpryan79/libBigWig.git
	cd libBigWig
	make install
	cd ..

	git clone https://github.com/samtools/htslib.git
	cd htslib 
	make install
	cd ..

	wget ftp://www.mirrorservice.org/sites/ftp.gnu.org/gnu/gsl/gsl-latest.tar.gz 
	tar -xvzpf gsl-latest.tar.gz
	cd gsl*
	./configure
	make
	make install
	cd ..

	git clone https://github.com/Ensembl/WiggleTools.git
	cd WiggleTools
	make
	cp wiggletools /usr/local/bin

%apprun bowtie
%apprun samblaster
