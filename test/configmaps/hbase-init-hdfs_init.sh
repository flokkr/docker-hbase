#!/usr/bin/env bash

retry() {
   n=0
   until [ $n -ge 30 ]
   do
      "$@" && break
      n=$[$n+1]
      echo "$n '$@' is failed..."
      sleep 3
   done
}

fix_permission() {
   hdfs dfs -chmod 777 /
}

retry fix_permission