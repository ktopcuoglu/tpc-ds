declare -a scale=("100" "1000" "3000")

for scale in "${arr[@]}"
do
    export tpc_scale=$scale;
    echo "scale: $scale";
     
    bigquery/010-prepare.sh;
    bigquery/020-import.sh;
    bigquery/030-assign_capacity.sh;
    bigquery/040-run_queries.sh;
    bigquery/050-run_queries_parallel.sh;
    bigquery/090-delete_capacity.sh;
done
