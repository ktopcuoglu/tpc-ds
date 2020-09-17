
with ssr as
 (select  s_store_id as store_id,
          sum(ss_ext_sales_price) as sales,
          sum(coalesce(sr_return_amt, 0)) as returns,
          sum(ss_net_profit - coalesce(sr_net_loss, 0)) as profit
  from {{tpc_schema_prefix}}_{{tpc_scale}}.store_sales left outer join {{tpc_schema_prefix}}_{{tpc_scale}}.store_returns on
         (ss_item_sk = sr_item_sk and ss_ticket_number = sr_ticket_number),
     {{tpc_schema_prefix}}_{{tpc_scale}}.date_dim,
     {{tpc_schema_prefix}}_{{tpc_scale}}.store,
     {{tpc_schema_prefix}}_{{tpc_scale}}.item,
     {{tpc_schema_prefix}}_{{tpc_scale}}.promotion
 where ss_sold_date_sk = d_date_sk
       and d_date between cast('1998-08-04' as date) 
                  and '1998-09-03'
       and ss_store_sk = s_store_sk
       and ss_item_sk = i_item_sk
       and i_current_price > 50
       and ss_promo_sk = p_promo_sk
       and p_channel_tv = 'N'
 group by s_store_id)
 ,
 csr as
 (select  cp_catalog_page_id as catalog_page_id,
          sum(cs_ext_sales_price) as sales,
          sum(coalesce(cr_return_amount, 0)) as returns,
          sum(cs_net_profit - coalesce(cr_net_loss, 0)) as profit
  from {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_sales left outer join {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_returns on
         (cs_item_sk = cr_item_sk and cs_order_number = cr_order_number),
     {{tpc_schema_prefix}}_{{tpc_scale}}.date_dim,
     {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_page,
     {{tpc_schema_prefix}}_{{tpc_scale}}.item,
     {{tpc_schema_prefix}}_{{tpc_scale}}.promotion
 where cs_sold_date_sk = d_date_sk
       and d_date between cast('1998-08-04' as date)
                  and '1998-09-03'
        and cs_catalog_page_sk = cp_catalog_page_sk
       and cs_item_sk = i_item_sk
       and i_current_price > 50
       and cs_promo_sk = p_promo_sk
       and p_channel_tv = 'N'
group by cp_catalog_page_id)
 ,
 wsr as
 (select  web_site_id,
          sum(ws_ext_sales_price) as sales,
          sum(coalesce(wr_return_amt, 0)) as returns,
          sum(ws_net_profit - coalesce(wr_net_loss, 0)) as profit
  from {{tpc_schema_prefix}}_{{tpc_scale}}.web_sales left outer join {{tpc_schema_prefix}}_{{tpc_scale}}.web_returns on
         (ws_item_sk = wr_item_sk and ws_order_number = wr_order_number),
     {{tpc_schema_prefix}}_{{tpc_scale}}.date_dim,
     {{tpc_schema_prefix}}_{{tpc_scale}}.web_site,
     {{tpc_schema_prefix}}_{{tpc_scale}}.item,
     {{tpc_schema_prefix}}_{{tpc_scale}}.promotion
 where ws_sold_date_sk = d_date_sk
       and d_date between cast('1998-08-04' as date)
                  and '1998-09-03'
        and ws_web_site_sk = web_site_sk
       and ws_item_sk = i_item_sk
       and i_current_price > 50
       and ws_promo_sk = p_promo_sk
       and p_channel_tv = 'N'
group by web_site_id)
  select  channel
        , id
        , sum(sales) as sales
        , sum(returns) as returns
        , sum(profit) as profit
 from 
 (select 'store channel' as channel
        , 'store' || store_id as id
        , sales
        , returns
        , profit
 from   ssr
 union all
 select 'catalog channel' as channel
        , 'catalog_page' || catalog_page_id as id
        , sales
        , returns
        , profit
 from  csr
 union all
 select 'web channel' as channel
        , 'web_site' || web_site_id as id
        , sales
        , returns
        , profit
 from   wsr
 ) x
 group by rollup (channel, id)
 order by channel
         ,id
 limit 100;


