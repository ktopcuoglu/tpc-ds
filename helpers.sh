mkdir -p stdout && mkdir -p stderr

function exec_with_log() {
    local start=`date +%s`
    local kpi=$1
    local cmd=$2
    local datestr=$(date +%Y%m%d-%H%M%S)
    local filename=${kpi//;/-}_$(date +%Y%m%d-%H%M%S)

    echo "cmd:$cmd"
    
    eval $cmd 1> ./stdout/$filename.out 2> ./stderr/$filename.err
    local exit_code=$?
    
    local end=`date +%s`
    local duration=$((end-start))
    
    #local exit_code=$([ -s ./stderr/$filename.err ] && echo "1" || echo "0")

    local error_line=$(head -n 1 ./stderr/$filename.err)
    [ -z "$error_line" ] && [ $exit_code -ne 0 ] && error_line=$(cat ./stdout/$filename.out | tr -d '\r\n')

    echo "${datestr};${kpi};${duration};${exit_code};${error_line}" >> benchmark_result.csv
}
