#!/usr/bin/env bash

set -x 

build() {
	docker build --build-arg URL=$URL --label io.github.flokkr.hbase.version=$HBASE_VERSION -t flokkr/hbase:${TAG} .
}

deploy() {
	docker push flokkr/hbase:${TAG}
}

TAG=latest
HBASE_VERSION=1.4.3

while getopts ":v:t:" opt; do
  case $opt in
    v)
      HBASE_VERSION=$OPTARG >&2
      ;;
    t)
      TAG=${OPTARG:-$HBASE_VERSION}
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

export URL=https://www-eu.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz

shift $(($OPTIND -1))
eval $*
