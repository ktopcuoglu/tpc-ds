
select   
    sum(ws_net_paid) as total_sum
   ,i_category
   ,i_class
   ,rank() over (
  partition by i_category,i_class
  order by sum(ws_net_paid) desc) as rank_within_parent
 from
    {{tpc_schema_prefix}}_{{tpc_scale}}.web_sales
   ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim       d1
   ,{{tpc_schema_prefix}}_{{tpc_scale}}.item
 where
    d1.d_month_seq between 1212 and 1212+11
 and d1.d_date_sk = ws_sold_date_sk
 and i_item_sk  = ws_item_sk
 group by rollup(i_category,i_class)
 order by i_category,i_class,rank_within_parent
 limit 100;
