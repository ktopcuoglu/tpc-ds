{% if tpc_dialect == "postgresql" %}
    {% set decimaltype = 'decimal(12,2)' %}
{% elif tpc_dialect == "bigquery" %}
    {% set decimaltype = 'numeric' %}
{% endif %}

select  i_item_id,
        ca_country,
        ca_state, 
        ca_county,
        avg( cast(cs_quantity as {{decimaltype}})) agg1,
        avg( cast(cs_list_price as {{decimaltype}})) agg2,
        avg( cast(cs_coupon_amt as {{decimaltype}})) agg3,
        avg( cast(cs_sales_price as {{decimaltype}})) agg4,
        avg( cast(cs_net_profit as {{decimaltype}})) agg5,
        avg( cast(c_birth_year as {{decimaltype}})) agg6,
        avg( cast(cd1.cd_dep_count as {{decimaltype}})) agg7
 from {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_sales
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.customer_demographics cd1
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.customer_demographics cd2
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.customer
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.customer_address
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
     ,{{tpc_schema_prefix}}_{{tpc_scale}}.item
 where cs_sold_date_sk = d_date_sk and
       cs_item_sk = i_item_sk and
       cs_bill_cdemo_sk = cd1.cd_demo_sk and
       cs_bill_customer_sk = c_customer_sk and
       cd1.cd_gender = 'M' and 
       cd1.cd_education_status = 'College' and
       c_current_cdemo_sk = cd2.cd_demo_sk and
       c_current_addr_sk = ca_address_sk and
       c_birth_month in (9,5,12,4,1,10) and
       d_year = 2001 and
       ca_state in ('ND','WI','AL'
                   ,'NC','OK','MS','TN')
 group by rollup (i_item_id, ca_country, ca_state, ca_county)
 order by ca_country,
        ca_state, 
        ca_county,
	i_item_id
 limit 100;


