FROM flokkr/base:29
ARG URL
ENV PATH $PATH:/opt/hbase/bin
ENV CONF_DIR /opt/hbase/conf
RUN adduser -h /opt/ -s /bin/bash -G flokkr -D hbase && chown hbase /opt
USER hbase
RUN wget $URL -O hbase.tar.gz && tar zxf hbase.tar.gz && rm hbase.tar.gz && mv /opt/hbase* /opt/hbase
WORKDIR /opt/hbase
