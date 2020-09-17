
select  i_item_id
      ,i_item_desc 
      ,i_category 
      ,i_class 
      ,i_current_price
      ,sum(ws_ext_sales_price) as itemrevenue 
      ,sum(ws_ext_sales_price)*100/sum(sum(ws_ext_sales_price)) over
          (partition by i_class) as revenueratio
from    {{tpc_schema_prefix}}_{{tpc_scale}}.web_sales
       ,{{tpc_schema_prefix}}_{{tpc_scale}}.item 
       ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
where ws_item_sk = i_item_sk 
 and i_category in ('Jewelry', 'Sports', 'Books')
 and ws_sold_date_sk = d_date_sk
 and d_date between cast('2001-01-12' as date) 
                and cast('2001-02-11' as date)
group by 
 i_item_id
        ,i_item_desc 
        ,i_category
        ,i_class
        ,i_current_price
order by 
 i_category
        ,i_class
        ,i_item_id
        ,i_item_desc
        ,revenueratio
limit 100;


