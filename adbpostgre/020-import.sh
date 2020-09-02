#!/bin/bash -e
shopt -s expand_aliases
source $TPCDS_HOME/tpc_aliases.sh

echo "create tpcds schema"
time j2 $TPCDS_HOME/adbpostgre/021-import_tables.sql | psql_adb --echo-all

#real    6m28.233s
#real    47m28.265s
#insert into tpcds_3000.catalog_sales select * from tpcds_3000.ext_catalog_sales;
#INSERT 0 4319964900
#Time: 2282155.044 ms (38:02.155)
#insert into tpcds_3000.store_sales select * from tpcds_3000.ext_store_sales;
#INSERT 0 8640035704
#Time: 3551156.731 ms (59:11.157)
#real    109m13.844s