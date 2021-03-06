
select  
   count(distinct ws_order_number) as order_count
  ,sum(ws_ext_ship_cost) as total_shipping_cost
  ,sum(ws_net_profit) as total_net_profit
from
   {{tpc_schema_prefix}}_{{tpc_scale}}.web_sales ws1
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.customer_address
  ,{{tpc_schema_prefix}}_{{tpc_scale}}.web_site
where
    d_date between '1999-5-01' and  '1999-06-30'
and ws1.ws_ship_date_sk = d_date_sk
and ws1.ws_ship_addr_sk = ca_address_sk
and ca_state = 'TX'
and ws1.ws_web_site_sk = web_site_sk
and web_company_name = 'pri'
and exists (select *
            from {{tpc_schema_prefix}}_{{tpc_scale}}.web_sales ws2
            where ws1.ws_order_number = ws2.ws_order_number
              and ws1.ws_warehouse_sk <> ws2.ws_warehouse_sk)
and not exists(select *
               from {{tpc_schema_prefix}}_{{tpc_scale}}.web_returns wr1
               where ws1.ws_order_number = wr1.wr_order_number)
order by count(distinct ws_order_number)
limit 100;


