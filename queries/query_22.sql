
select  i_product_name
             ,i_brand
             ,i_class
             ,i_category
             ,avg(inv_quantity_on_hand) qoh
       from {{tpc_schema_prefix}}_{{tpc_scale}}.inventory
           ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
           ,{{tpc_schema_prefix}}_{{tpc_scale}}.item
       where inv_date_sk=d_date_sk
              and inv_item_sk=i_item_sk
              and d_month_seq between 1212 and 1212 + 11
       group by rollup(i_product_name
                       ,i_brand
                       ,i_class
                       ,i_category)
order by qoh, i_product_name, i_brand, i_class, i_category
limit 100;


