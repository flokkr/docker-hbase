ARG BASE=latest
FROM flokkr/base:${BASE}
ARG ARTIFACTDIR
ENV CONF_DIR /opt/hbase/conf
RUN useradd --uid 1000 hbase --gid 1000 -G flokkr --home /opt/hbase && chown hbase /opt
USER hbase
ADD --chown=hbase:flokkr ${ARTIFACTDIR} /opt/hbase
ENV PATH $PATH:/opt/hbase/bin
WORKDIR /opt/hbase
