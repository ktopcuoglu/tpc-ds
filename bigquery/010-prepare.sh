#!/bin/bash -e
echo "create dataset: ${bq_project}:${tpc_schema_prefix}_${tpc_scale}"

bq rm -r -f -d ${bq_project}:${tpc_schema_prefix}_${tpc_scale};
bq --location=${bq_location} mk --dataset ${bq_project}:${tpc_schema_prefix}_${tpc_scale};

echo "create tables"
j2 bigquery/011-create_tables.sql | bq query --project_id=${bq_project} --location=${bq_location} --nouse_legacy_sql

echo "done"