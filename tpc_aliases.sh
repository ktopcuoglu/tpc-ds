alias psql_adb="psql -d $adb_db -h $adb_host -p $adb_port -U $adb_user --set TIMING=ON --set ON_ERROR_STOP=1 --set AUTOCOMMIT=ON"
