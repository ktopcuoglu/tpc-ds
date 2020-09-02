#!/bin/bash -ex
#tpc1000 ./bigquery/013-import.sh  14.79s user 3.18s system 2% cpu 12:15.73 total

#customer_address
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.customer_address gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/customer_address/*

#customer_demographics
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.customer_demographics gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/customer_demographics/*

#date_dim
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.date_dim gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/date_dim/*

#warehouse
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.warehouse gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/warehouse/*

#ship_mode
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.ship_mode gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/ship_mode/*

#time_dim
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.time_dim gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/time_dim/*

#reason
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.reason gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/reason/*

#income_band
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.income_band gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/income_band/*

#item
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.item gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/item/*

#store
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.store gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/store/*

#call_center
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.call_center gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/call_center/*

#customer
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.customer gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/customer/*

#web_site
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.web_site gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/web_site/*

#store_returns
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.store_returns gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/store_returns/*

#household_demographics
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.household_demographics gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/household_demographics/*

#web_page
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.web_page gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/web_page/*

#promotion
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.promotion gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/promotion/*

#catalog_page
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.catalog_page gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/catalog_page/*

#inventory
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.inventory gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/inventory/*

#catalog_returns
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.catalog_returns gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/catalog_returns/*

#web_returns
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.web_returns gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/web_returns/*

#web_sales
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.web_sales gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/web_sales/*

#catalog_sales
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.catalog_sales gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/catalog_sales/*

#store_sales
time bq --location=${bq_location} load --field_delimiter='|' --project_id=${bq_project} --replace --source_format=CSV ${bq_project}:${tpc_schema_prefix}_${tpc_scale}.store_sales gs://tpc-ds-eu/tpcds/tpcds_${tpc_scale}/store_sales/*
