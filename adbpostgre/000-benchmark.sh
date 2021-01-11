#!/bin/bash -e

declare -a scale=("100" "1000" "3000")

for scale in "${arr[@]}"
do
    export tpc_scale=$scale;    
    echo "scale: $scale";
    
    adbpostgre/010-prepare.sh;
    adbpostgre/020-import.sh;
    adbpostgre/030-warmup.sh;
    adbpostgre/040-run_queries.sh;
    adbpostgre/050-run_queries_parallel.sh;
done
