FROM centos:7

LABEL maintainer="Daniel Fernandez Perez (daniel.fernandez.perez@gmail.com)"

ARG COMMIT_HASH
ENV PATH /UMICollapse/:$PATH

RUN yum -y install java-11-openjdk java-11-openjdk-devel tzdata curl unzip bash git which

RUN git clone https://github.com/Daniel-Liu-c0deb0t/UMICollapse.git \
    && cd UMICollapse \
    && git reset --hard ${COMMIT_HASH} \
    && mkdir lib \
    && cd lib \
    && curl -O -L https://repo1.maven.org/maven2/com/github/samtools/htsjdk/2.19.0/htsjdk-2.19.0.jar \
    && curl -O -L https://repo1.maven.org/maven2/org/xerial/snappy/snappy-java/1.1.7.3/snappy-java-1.1.7.3.jar