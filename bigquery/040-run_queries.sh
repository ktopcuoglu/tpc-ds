#!/bin/bash
shopt -s expand_aliases
source $TPCDS_HOME/helpers.sh
source $TPCDS_HOME/tpc_aliases.sh

export tpc_dialect=bigquery

for n in `seq 1 99`
  do
    exec_with_log "bigquery;tpc_${tpc_scale};query;query${n}" "j2 ./queries/query_$n.sql | bq -q --project_id=$bq_project --location=$bq_location query --use_legacy_sql=false --use_cache=false --batch=false"
    sleep 1
done
