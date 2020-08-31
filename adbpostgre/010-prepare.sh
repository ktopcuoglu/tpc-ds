#!/bin/bash -e
shopt -s expand_aliases
source $TPCDS_HOME/tpc_aliases.sh

echo "create tpcds schema"
time j2 $TPCDS_HOME/adbpostgre/011-create_schema.sql | psql_adb --echo-all

echo "create tpcds tables (external)"
time j2 $TPCDS_HOME/adbpostgre/012-create_external_tables.sql | psql_adb --echo-all

echo "create tpcds tables (managed)"
time j2 $TPCDS_HOME/adbpostgre/013-create_tables.sql | psql_adb --echo-all
