#!/bin/bash -e
shopt -s expand_aliases
source $TPCDS_HOME/tpc_aliases.sh

echo "create tpcds schema"
time j2 $TPCDS_HOME/adbpostgre/021-import_tables.sql | psql_adb --echo-all

#real    6m28.233s
#real    47m28.265s