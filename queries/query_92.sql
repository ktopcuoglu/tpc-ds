
select  
   sum(ws_ext_discount_amt)  as Excess_Discount_Amount
from 
    {{tpc_schema_prefix}}_{{tpc_scale}}.web_sales 
   ,{{tpc_schema_prefix}}_{{tpc_scale}}.item 
   ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
where
i_manufact_id = 269
and i_item_sk = ws_item_sk 
and d_date between '1998-03-18' and  '1998-06-16'
and d_date_sk = ws_sold_date_sk 
and ws_ext_discount_amt  
     > ( 
         SELECT 
            1.3 * avg(ws_ext_discount_amt) 
         FROM 
            {{tpc_schema_prefix}}_{{tpc_scale}}.web_sales 
           ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
         WHERE 
              ws_item_sk = i_item_sk 
          and d_date between '1998-03-18' and '1998-06-16'
          and d_date_sk = ws_sold_date_sk 
      ) 
order by sum(ws_ext_discount_amt)
limit 100;


