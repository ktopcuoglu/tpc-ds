#!/bin/bash
shopt -s expand_aliases
source $TPCDS_HOME/tpc_aliases.sh

RESULTS_DIR=.
for n in `seq 1 99`
  do
    q="queries/query_$n.sql"
    echo "q: $q"
    if [ -f "$q" ]; then
        echo "======= query $n =======" 
        time j2 $q |psql_adb > $RESULTS_DIR/results/$n 2> $RESULTS_DIR/errors/$n
    fi
    sleep 1
done
