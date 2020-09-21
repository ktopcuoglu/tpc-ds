#!/bin/bash -e
shopt -s expand_aliases
source $TPCDS_HOME/tpc_aliases.sh
source $TPCDS_HOME/helpers.sh

export -f exec_with_log
export tpc_dialect=postgresql

arrQ=($(seq 1 99))
unset arrQ[66]  #Q67
unset arrQ[71]  #Q72
arrQ=("${arrQ[@]}")

echo ${arrQ[@]}

SECONDS=0
parallel -P ${tpc_px_count} --lb 'exec_with_log "adbpostgre;tpc_${tpc_scale};px${tpc_px_count}_query;query{}" "j2 ./queries/query_{}.sql | psql -d $adb_db -h $adb_host -p $adb_port -U $adb_user"' ::: "${arrQ[@]}"
exec_with_log "adbpostgre;tpc_${tpc_scale};px${tpc_px_count}_query_timing;$SECONDS" "echo x"
