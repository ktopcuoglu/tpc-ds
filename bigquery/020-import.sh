#!/bin/bash
source $TPCDS_HOME/helpers.sh

declare -a arr=("customer_address" "customer_demographics" "date_dim" \
                "warehouse" "ship_mode" "time_dim" "reason" "income_band" \
                "item" "store" "call_center" "customer" "web_site" "store_returns" \
                "household_demographics" "web_page" "promotion" "catalog_page" \
                "inventory" "catalog_returns" "web_returns" "web_sales" "catalog_sales" "store_sales")

for table_name in "${arr[@]}"
do
    exec_with_log "bigquery;tpc_${tpc_scale};load;${table_name}" bq -q --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.${table_name} gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/${table_name}/*
    sleep 1
done
