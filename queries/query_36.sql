
select  
    sum(ss_net_profit)/sum(ss_ext_sales_price) as gross_margin
   ,i_category
   ,i_class
   ,rank() over (partition by i_category,i_class
 	                   order by sum(ss_net_profit)/sum(ss_ext_sales_price) asc
                ) as rank_within_parent
 from
    {{tpc_schema_prefix}}_{{tpc_scale}}.store_sales
   ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim d1
   ,{{tpc_schema_prefix}}_{{tpc_scale}}.item
   ,{{tpc_schema_prefix}}_{{tpc_scale}}.store
 where
    d1.d_year = 2000 
 and d1.d_date_sk = ss_sold_date_sk
 and i_item_sk  = ss_item_sk 
 and s_store_sk  = ss_store_sk
 and s_state in ('TN','TN','TN','TN',
                 'TN','TN','TN','TN')
 group by i_category,i_class
 order by i_category
         ,rank_within_parent
  limit 100;
