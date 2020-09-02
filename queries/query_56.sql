
with ss as (
        select i_item_id,sum(ss_ext_sales_price) total_sales
        from    {{tpc_schema}}.store_sales,
                {{tpc_schema}}.date_dim,
                {{tpc_schema}}.customer_address,
                {{tpc_schema}}.item
        where i_item_id in (select i_item_id
                        from {{tpc_schema}}.item
                        where i_color in ('orchid','chiffon','lace'))
        and     ss_item_sk              = i_item_sk
        and     ss_sold_date_sk         = d_date_sk
        and     d_year                  = 2000
        and     d_moy                   = 1
        and     ss_addr_sk              = ca_address_sk
        and     ca_gmt_offset           = -8 
        group by i_item_id
 ),cs as (
 select i_item_id,sum(cs_ext_sales_price) total_sales
 from    {{tpc_schema}}.catalog_sales,
         {{tpc_schema}}.date_dim,
         {{tpc_schema}}.customer_address,
         {{tpc_schema}}.item
where i_item_id               in (select i_item_id
                                    from {{tpc_schema}}.item
                                   where i_color in ('orchid','chiffon','lace'))
 and     cs_item_sk              = i_item_sk
 and     cs_sold_date_sk         = d_date_sk
 and     d_year                  = 2000
 and     d_moy                   = 1
 and     cs_bill_addr_sk         = ca_address_sk
 and     ca_gmt_offset           = -8 
 group by i_item_id),
 ws as (
 select i_item_id,sum(ws_ext_sales_price) total_sales
 from
         {{tpc_schema}}.web_sales,
         {{tpc_schema}}.date_dim,
         {{tpc_schema}}.customer_address,
         {{tpc_schema}}.item
 where
         i_item_id               in (select
  i_item_id
from {{tpc_schema}}.item
where i_color in ('orchid','chiffon','lace'))
 and     ws_item_sk              = i_item_sk
 and     ws_sold_date_sk         = d_date_sk
 and     d_year                  = 2000
 and     d_moy                   = 1
 and     ws_bill_addr_sk         = ca_address_sk
 and     ca_gmt_offset           = -8
 group by i_item_id)
  select  i_item_id ,sum(total_sales) total_sales
 from  (select * from ss 
        union all
        select * from cs 
        union all
        select * from ws) tmp1
 group by i_item_id
 order by total_sales,
          i_item_id
 limit 100;

