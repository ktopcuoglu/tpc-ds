echo "create flex commitment"
bq mk \
 --project_id=$bq_project \
 --location=$bq_location \
 --capacity_commitment \
 --plan=FLEX \
 --slots=$bq_flex_slots

echo "create reservation"
 bq mk \
 --project_id=$bq_project \
 --location=$bq_location \
 --reservation \
 --slots=$bq_flex_slots \
 --nouse_idle_slots \
 tpc

echo "assign reservation"
 bq mk \
 --project_id=$bq_project \
 --location=$bq_location \
 --reservation_assignment \
 --reservation_id=$bq_project:$bq_location.tpc \
 --job_type=QUERY \
 --assignee_id=$bq_project \
 --assignee_type=PROJECT

echo "wait a minute..."
sleep 60