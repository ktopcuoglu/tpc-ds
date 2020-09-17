
select  
   count(distinct cs_order_number) as order_count
  ,sum(cs_ext_ship_cost) as total_shipping_cost
  ,sum(cs_net_profit) as total_net_profit
from
   {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_sales cs1
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.customer_address
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.call_center
where
    d_date between '1999-02-01' and  cast('1999-04-02' as date)
and cs1.cs_ship_date_sk = d_date_sk
and cs1.cs_ship_addr_sk = ca_address_sk
and ca_state = 'IL'
and cs1.cs_call_center_sk = cc_call_center_sk
and cc_county in ('Williamson County','Williamson County','Williamson County','Williamson County',
                  'Williamson County'
)
and exists (select *
            from {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_sales cs2
            where cs1.cs_order_number = cs2.cs_order_number
              and cs1.cs_warehouse_sk <> cs2.cs_warehouse_sk)
and not exists(select *
               from {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_returns cr1
               where cs1.cs_order_number = cr1.cr_order_number)
order by count(distinct cs_order_number)
limit 100;


