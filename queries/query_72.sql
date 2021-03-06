
select  i_item_desc
      ,w_warehouse_name
      ,d1.d_week_seq
      ,sum(case when p_promo_sk is null then 1 else 0 end) no_promo
      ,sum(case when p_promo_sk is not null then 1 else 0 end) promo
      ,count(*) total_cnt
from {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_sales
join {{tpc_schema_prefix}}_{{tpc_scale}}.inventory on (cs_item_sk = inv_item_sk and cs_sold_date_sk = inv_date_sk and cs_warehouse_sk = inv_warehouse_sk)
join {{tpc_schema_prefix}}_{{tpc_scale}}.warehouse on (w_warehouse_sk=inv_warehouse_sk)
join {{tpc_schema_prefix}}_{{tpc_scale}}.item on (i_item_sk = cs_item_sk)
join {{tpc_schema_prefix}}_{{tpc_scale}}.customer_demographics on (cs_bill_cdemo_sk = cd_demo_sk)
join {{tpc_schema_prefix}}_{{tpc_scale}}.household_demographics on (cs_bill_hdemo_sk = hd_demo_sk)
join {{tpc_schema_prefix}}_{{tpc_scale}}.date_dim d1 on (cs_sold_date_sk = d1.d_date_sk)
join {{tpc_schema_prefix}}_{{tpc_scale}}.date_dim d3 on (cs_ship_date_sk = d3.d_date_sk)
left outer join {{tpc_schema_prefix}}_{{tpc_scale}}.promotion on (cs_promo_sk=p_promo_sk)
left outer join {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_returns on (cr_item_sk = cs_item_sk and cr_order_number = cs_order_number)
where inv_quantity_on_hand < cs_quantity 
  and d3.d_date > {{ 'date_add(d1.d_date, interval 5 day)' if tpc_dialect == "bigquery" else 'd1.d_date + 5' }} 
  and hd_buy_potential = '1001-5000'
  and d1.d_year = 2001
  and cd_marital_status = 'M'
group by i_item_desc,w_warehouse_name,d1.d_week_seq
order by total_cnt desc, i_item_desc, w_warehouse_name, d_week_seq
limit 100;

