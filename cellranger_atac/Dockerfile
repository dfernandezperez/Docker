FROM rockylinux:9

LABEL maintainer="Daniel Fernandez Perez (daniel.fernandez.perez@gmail.com)"

ARG CELLRANGER_VERSION
ARG DOWNLOAD_URL
ENV PATH /opt/cellranger-atac-${CELLRANGER_VERSION}:$PATH

RUN dnf group install -y "Development Tools" \
    && dnf install -y which \
    && dnf clean all

# cell ranger binaries
RUN curl -o cellranger-atac-${CELLRANGER_VERSION}.tar.gz ${DOWNLOAD_URL} \
    && tar xzf cellranger-atac-${CELLRANGER_VERSION}.tar.gz \
    && rm -rf cellranger-atac-${CELLRANGER_VERSION}.tar.gz \
    && mv cellranger-atac-${CELLRANGER_VERSION} /opt/

WORKDIR /opt

ENTRYPOINT [ "cellranger-atac" ]
