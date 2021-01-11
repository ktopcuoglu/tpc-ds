#!/bin/bash -e
shopt -s expand_aliases

echo "create tpcds schema"
time j2 $TPCDS_HOME/adbpostgre/011-create_schema.sql | psql -d $adb_db -h $adb_host -p $adb_port -U $adb_user --set TIMING=ON --set ON_ERROR_STOP=1 --set AUTOCOMMIT=ON --echo-all

echo "create tpcds tables (external)"
time j2 $TPCDS_HOME/adbpostgre/012-create_external_tables.sql | psql -d $adb_db -h $adb_host -p $adb_port -U $adb_user --set TIMING=ON --set ON_ERROR_STOP=1 --set AUTOCOMMIT=ON --echo-all

echo "create tpcds tables (managed)"
time j2 $TPCDS_HOME/adbpostgre/013-create_tables.sql | psql -d $adb_db -h $adb_host -p $adb_port -U $adb_user --set TIMING=ON --set ON_ERROR_STOP=1 --set AUTOCOMMIT=ON --echo-all
