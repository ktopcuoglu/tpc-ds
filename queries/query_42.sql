
select  dt.d_year
       ,item.i_category_id
       ,item.i_category
       ,sum(ss_ext_sales_price)
 from   {{tpc_schema_prefix}}_{{tpc_scale}}.date_dim dt
       ,{{tpc_schema_prefix}}_{{tpc_scale}}.store_sales
       ,{{tpc_schema_prefix}}_{{tpc_scale}}.item
 where dt.d_date_sk = store_sales.ss_sold_date_sk
       and store_sales.ss_item_sk = item.i_item_sk
       and item.i_manager_id = 1        
       and dt.d_moy=12
       and dt.d_year=1998
 group by    dt.d_year
             ,item.i_category_id
             ,item.i_category
 order by    sum(ss_ext_sales_price) desc
             ,dt.d_year
             ,item.i_category_id
             ,item.i_category
limit 100 ;


