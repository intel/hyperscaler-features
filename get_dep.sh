#!/bin/bash

CLEANUP=${1:-"no"}
if [ "${CLEANUP}" != "no" ]; then
  rm -rf ./apache-hive-3.1.3-bin
  rm -rf ./hadoop-3.3.6
  rm -f ./postgresql-42.6.0.jar
fi

if [ ! -d "./apache-hive-3.1.3-bin" ]; then
  wget "https://downloads.apache.org/hive/hive-3.1.3/apache-hive-3.1.3-bin.tar.gz"
  tar zxvf ./apache-hive-3.1.3-bin.tar.gz
  rm ./apache-hive-3.1.3-bin.tar.gz
fi

if [ ! -d "./hadoop-3.3.6" ]; then
  wget "https://archive.apache.org/dist/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz"
  tar zxvf ./hadoop-3.3.6.tar.gz
  rm ./hadoop-3.3.6.tar.gz
fi

if [ ! -f "./postgresql-42.6.0.jar" ]; then
  wget "https://jdbc.postgresql.org/download/postgresql-42.6.0.jar"
fi

cp ./postgresql-42.6.0.jar ./apache-hive-3.1.3-bin/lib

chmod +x ./start-metastore
cp ./start-metastore ./apache-hive-3.1.3-bin/bin
