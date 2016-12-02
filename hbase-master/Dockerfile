FROM elek/hbase-base
EXPOSE 16010
COPY start.sh .
COPY hbase-site.default /opt/hbase/conf/hbase-site.default
COPY log4j.properties /opt/hbase/conf/
CMD ["/opt/start.sh"]

