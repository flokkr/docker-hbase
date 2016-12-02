set -e
docker build -t elek/hbase-base hbase-base
docker build -t elek/hbase-master hbase-master 
docker build -t elek/hbase-regionserver hbase-regionserver
