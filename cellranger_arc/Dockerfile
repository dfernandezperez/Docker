FROM centos:7

LABEL maintainer="Daniel Fernandez Perez (daniel.fernandez.perez@gmail.com)"

ARG CELLRANGER_VERSION
ARG DOWNLOAD_URL
ENV PATH /opt/cellranger-arc-${CELLRANGER_VERSION}:$PATH

RUN yum group install -y "Development Tools" \
    && yum install -y which

# cell ranger binaries
RUN curl -o cellranger-arc-${CELLRANGER_VERSION}.tar.gz ${DOWNLOAD_URL} \
    && tar xzf cellranger-arc-${CELLRANGER_VERSION}.tar.gz \
    && rm -rf cellranger-arc-${CELLRANGER_VERSION}.tar.gz \
    && mv cellranger-arc-${CELLRANGER_VERSION} /opt/

WORKDIR /opt

ENTRYPOINT [ "cellranger-arc" ]
