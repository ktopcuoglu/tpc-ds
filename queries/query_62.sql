
select  
   substr(w_warehouse_name,1,20)
  ,sm_type
  ,web_name
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk <= 30 ) then 1 else 0 end)  as days_30 
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk > 30) and 
                 (ws_ship_date_sk - ws_sold_date_sk <= 60) then 1 else 0 end )  as days_31_60
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk > 60) and 
                 (ws_ship_date_sk - ws_sold_date_sk <= 90) then 1 else 0 end)  as days_61_90
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk > 90) and
                 (ws_ship_date_sk - ws_sold_date_sk <= 120) then 1 else 0 end)  as days_91_120
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk  > 120) then 1 else 0 end)  as days_gt_120
from
   {{tpc_schema_prefix}}_{{tpc_scale}}.web_sales
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.warehouse
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.ship_mode
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.web_site
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
where
    d_month_seq between 1212 and 1212 + 11
and ws_ship_date_sk   = d_date_sk
and ws_warehouse_sk   = w_warehouse_sk
and ws_ship_mode_sk   = sm_ship_mode_sk
and ws_web_site_sk    = web_site_sk
group by
   substr(w_warehouse_name,1,20)
  ,sm_type
  ,web_name
order by 1
        ,sm_type
       ,web_name
limit 100;


