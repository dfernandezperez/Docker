FROM centos:7

LABEL maintainer="Daniel Fernandez Perez (daniel.fernandez.perez@gmail.com)"

ARG CELLRANGER_VERSION
ARG DOWNLOAD_URL
ENV PATH /opt/cellranger-atac-${CELLRANGER_VERSION}:$PATH

RUN yum group install -y "Development Tools" \
    && yum install -y which

# cell ranger binaries
RUN curl -o cellranger-atac-${CELLRANGER_VERSION}.tar.gz ${DOWNLOAD_URL} \
    && tar xzf cellranger-atac-${CELLRANGER_VERSION}.tar.gz \
    && rm -rf cellranger-atac-${CELLRANGER_VERSION}.tar.gz \
    && mv cellranger-atac-${CELLRANGER_VERSION} /opt/

WORKDIR /opt

ENTRYPOINT [ "cellranger-atac" ]
