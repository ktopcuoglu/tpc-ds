#!/bin/bash
shopt -s expand_aliases
source $TPCDS_HOME/tpc_aliases.sh

q="adbpostgre/031-analyze_stats.sql"

time j2 $q |psql_adb