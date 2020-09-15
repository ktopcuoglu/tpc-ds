#!/bin/bash
shopt -s expand_aliases
source $TPCDS_HOME/tpc_aliases.sh

export tpc_dialect=postgre

RESULTS_DIR=.
for n in `seq 1 99`
  do
    q="queries/query_$n.sql"
    if [ -f "$q" ]; then
        echo "======= query $n =======" 
        SECONDS=0
        j2 $q |psql_adb > $RESULTS_DIR/results/$n 2> $RESULTS_DIR/errors/$n
        echo "${tpc_scale},${n},${SECONDS}" >> benchmark_adbposgtre.csv
        sleep 1
    fi
done
