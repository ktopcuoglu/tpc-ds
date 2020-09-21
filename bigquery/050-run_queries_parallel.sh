#!/bin/bash -e
shopt -s expand_aliases
source $TPCDS_HOME/helpers.sh
source $TPCDS_HOME/tpc_aliases.sh

export -f exec_with_log
export tpc_dialect=bigquery

arrQ=($(seq 1 99))
unset arrQ[66]  #Q67
unset arrQ[71]  #Q72
arrQ=("${arrQ[@]}")

echo ${arrQ[@]}

SECONDS=0
parallel -P ${tpc_px_count} --lb 'exec_with_log "bigquery;tpc_${tpc_scale};px${tpc_px_count}_query;query{}" "j2 ./queries/query_{}.sql | bq -q --project_id=$bq_project --location=$bq_location query --use_legacy_sql=false --use_cache=false --batch=false"' ::: "${arrQ[@]}"
exec_with_log "bigquery;tpc_${tpc_scale};px${tpc_px_count}_query_timing;$SECONDS" "echo x"