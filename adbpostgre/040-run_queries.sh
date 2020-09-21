#!/bin/bash
shopt -s expand_aliases
source $TPCDS_HOME/tpc_aliases.sh
source $TPCDS_HOME/helpers.sh

export tpc_dialect=postgresql

for n in `seq 1 99`
do
    sql_file="$TPCDS_HOME/queries/query_$n.sql"
    exec_with_log "adbpostgre;tpc_${tpc_scale};query;query${n}"  "j2 $sql_file | psql -d $adb_db -h $adb_host -p $adb_port -U $adb_user --set TIMING=ON --set ON_ERROR_STOP=1 --set AUTOCOMMIT=ON"
    sleep 1
done
