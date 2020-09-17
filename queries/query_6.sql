
select  a.ca_state state, count(*) cnt
 from {{tpc_schema_prefix}}_{{tpc_scale}}.customer_address a
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.customer c
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.store_sales s
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim d
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.item i
 where       a.ca_address_sk = c.c_current_addr_sk
   and c.c_customer_sk = s.ss_customer_sk
   and s.ss_sold_date_sk = d.d_date_sk
   and s.ss_item_sk = i.i_item_sk
   and d.d_month_seq = 
        (select distinct (d_month_seq)
         from {{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
               where d_year = 2000
           and d_moy = 2 )
   and i.i_current_price > 1.2 * 
             (select avg(j.i_current_price) 
        from {{tpc_schema_prefix}}_{{tpc_scale}}.item j 
        where j.i_category = i.i_category)
 group by a.ca_state
 having count(*) >= 10
 order by cnt, a.ca_state 
 limit 100;


