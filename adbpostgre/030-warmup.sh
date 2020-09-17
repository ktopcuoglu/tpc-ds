#!/bin/bash
shopt -s expand_aliases
source $TPCDS_HOME/helpers.sh
source $TPCDS_HOME/tpc_aliases.sh

echo "analyze tables"

declare -a arr=("customer_address" "customer_demographics" "date_dim" \
                "warehouse" "ship_mode" "time_dim" "reason" "income_band" \
                "item" "store" "call_center" "customer" "web_site" "store_returns" \
                "household_demographics" "web_page" "promotion" "catalog_page" \
                "inventory" "catalog_returns" "web_returns" "web_sales" "catalog_sales" "store_sales")

for table_name in "${arr[@]}"
do
    sql_file="/tmp/analyze_${table_name}_${tpc_scale}_$(date +%s)"
    echo "analyze fullscan ${tpc_schema_prefix}_${tpc_scale}.${table_name};"  > $sql_file 
    exec_with_log "adbpostgre;tpc_${tpc_scale};analyze;${table_name}"  "cat $sql_file | psql -d $adb_db -h $adb_host -p $adb_port -U $adb_user --set TIMING=ON --set ON_ERROR_STOP=1 --set AUTOCOMMIT=ON"
    rm $sql_file
    sleep 1
done