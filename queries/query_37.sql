
select  i_item_id
       ,i_item_desc
       ,i_current_price
 from {{tpc_schema}}.item
    , {{tpc_schema}}.inventory
    , {{tpc_schema}}.date_dim
    , {{tpc_schema}}.catalog_sales
 where i_current_price between 22 and 22 + 30
 and inv_item_sk = i_item_sk
 and d_date_sk=inv_date_sk
 and d_date between '2001-06-02' and '2001-08-01'
 and i_manufact_id in (678,964,918,849)
 and inv_quantity_on_hand between 100 and 500
 and cs_item_sk = i_item_sk
 group by i_item_id,i_item_desc,i_current_price
 order by i_item_id
 limit 100;


