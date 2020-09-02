
select  count(*) from (
    select distinct c_last_name, c_first_name, d_date
    from {{tpc_schema}}.store_sales
       , {{tpc_schema}}.date_dim
       , {{tpc_schema}}.customer
    where store_sales.ss_sold_date_sk = date_dim.d_date_sk
      and store_sales.ss_customer_sk = customer.c_customer_sk
      and d_month_seq between 1212 and 1212 + 11
  intersect
    select distinct c_last_name, c_first_name, d_date
    from {{tpc_schema}}.catalog_sales
       , {{tpc_schema}}.date_dim
       , {{tpc_schema}}.customer
    where catalog_sales.cs_sold_date_sk = date_dim.d_date_sk
      and catalog_sales.cs_bill_customer_sk = customer.c_customer_sk
      and d_month_seq between 1212 and 1212 + 11
  intersect
    select distinct c_last_name, c_first_name, d_date
    from {{tpc_schema}}.web_sales
       , {{tpc_schema}}.date_dim
       , {{tpc_schema}}.customer
    where web_sales.ws_sold_date_sk = date_dim.d_date_sk
      and web_sales.ws_bill_customer_sk = customer.c_customer_sk
      and d_month_seq between 1212 and 1212 + 11
) hot_cust
limit 100;

