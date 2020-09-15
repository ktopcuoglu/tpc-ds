echo "get reservation assignee_id"
assignment_id=$(bq show \
                    --project_id=$bq_project \
                    --location=$bq_location \
                    --reservation_assignment \
                    --job_type=QUERY \
                    --assignee_id=$bq_project \
                    --assignee_type=PROJECT \
                    --format=csv \
                | awk 'NR==2' \
                | cut -d ',' -f 1 \
                | cut -d '/' -f 2,4,6,8 \
                | sed 's|/|:|' \
                | sed 's|/|.|g')

echo "delete reservation assignment"
bq rm \
  --project_id=$bq_project \
  --location=$bq_location \
  --reservation_assignment \
  $assignment_id

echo "delete reservation"
bq rm \
  --project_id=$bq_project \
  --location=$bq_location \
  --reservation \
  tpc

echo "get commitment_id"
commitment_id=$(bq ls \
                    --capacity_commitment \
                    --location=$bq_location \
                    --project_id=$bq_project \
                    --format=csv \
                | awk 'NR==2' \
                | cut -d ',' -f 1 \
                | cut -d '/' -f 2,4,6 \
                | sed 's|/|:|' \
                | sed 's|/|.|g')


echo "delete commitment: $commitment_id"
bq rm \
 --project_id=$bq_project \
 --location=$bq_location \
 --capacity_commitment \
 $commitment_id
