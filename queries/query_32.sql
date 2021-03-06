
select  sum(cs_ext_discount_amt)  as excess_discount_amount
from {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_sales 
    ,{{tpc_schema_prefix}}_{{tpc_scale}}.item 
    ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
where i_manufact_id = 269
  and i_item_sk = cs_item_sk 
  and d_date between '1998-03-18' and '1998-06-16'
  and d_date_sk = cs_sold_date_sk 
  and cs_ext_discount_amt  > (select 1.3 * avg(cs_ext_discount_amt) 
                                from {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_sales 
                                    ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
                                 where cs_item_sk = i_item_sk 
                                   and d_date between '1998-03-18' and '1998-06-16'
                                   and d_date_sk = cs_sold_date_sk 
                              ) 
limit 100;
