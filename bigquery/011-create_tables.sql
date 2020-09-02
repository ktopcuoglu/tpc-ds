create table {{tpc_schema_prefix}}_{{tpc_scale}}.customer_address
(
    ca_address_sk             int64               not null,
    ca_address_id             string              not null,
    ca_street_number          string                      ,
    ca_street_name            string                   ,
    ca_street_type            string                      ,
    ca_suite_number           string                      ,
    ca_city                   string                   ,
    ca_county                 string                   ,
    ca_state                  string                       ,
    ca_zip                    string                      ,
    ca_country                string                   ,
    ca_gmt_offset             float64                  ,
    ca_location_type          string                      
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.customer_demographics
(
    cd_demo_sk                int64               not null,
    cd_gender                 string                       ,
    cd_marital_status         string                       ,
    cd_education_status       string                      ,
    cd_purchase_estimate      int64                       ,
    cd_credit_rating          string                      ,
    cd_dep_count              int64                       ,
    cd_dep_employed_count     int64                       ,
    cd_dep_college_count      int64                       
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.date_dim
(
    d_date_sk                 int64               not null,
    d_date_id                 string              not null,
    d_date                    date                          ,
    d_month_seq               int64                       ,
    d_week_seq                int64                       ,
    d_quarter_seq             int64                       ,
    d_year                    int64                       ,
    d_dow                     int64                       ,
    d_moy                     int64                       ,
    d_dom                     int64                       ,
    d_qoy                     int64                       ,
    d_fy_year                 int64                       ,
    d_fy_quarter_seq          int64                       ,
    d_fy_week_seq             int64                       ,
    d_day_name                string                       ,
    d_quarter_name            string                       ,
    d_holiday                 string                       ,
    d_weekend                 string                       ,
    d_following_holiday       string                       ,
    d_first_dom               int64                       ,
    d_last_dom                int64                       ,
    d_same_day_ly             int64                       ,
    d_same_day_lq             int64                       ,
    d_current_day             string                       ,
    d_current_week            string                       ,
    d_current_month           string                       ,
    d_current_quarter         string                       ,
    d_current_year            string                       
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.warehouse
(
    w_warehouse_sk            int64               not null,
    w_warehouse_id            string              not null,
    w_warehouse_name          string                   ,
    w_warehouse_sq_ft         int64                       ,
    w_street_number           string                      ,
    w_street_name             string                   ,
    w_street_type             string                      ,
    w_suite_number            string                      ,
    w_city                    string                   ,
    w_county                  string                   ,
    w_state                   string                       ,
    w_zip                     string                      ,
    w_country                 string                   ,
    w_gmt_offset              float64                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.ship_mode
(
    sm_ship_mode_sk           int64               not null,
    sm_ship_mode_id           string              not null,
    sm_type                   string                      ,
    sm_code                   string                      ,
    sm_carrier                string                      ,
    sm_contract               string                      
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.time_dim
(
    t_time_sk                 int64               not null,
    t_time_id                 string              not null,
    t_time                    int64                       ,
    t_hour                    int64                       ,
    t_minute                  int64                       ,
    t_second                  int64                       ,
    t_am_pm                   string                       ,
    t_shift                   string                      ,
    t_sub_shift               string                      ,
    t_meal_time               string                      
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.reason
(
    r_reason_sk               int64               not null,
    r_reason_id               string              not null,
    r_reason_desc             string                     
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.income_band
(
    ib_income_band_sk         int64               not null,
    ib_lower_bound            int64                       ,
    ib_upper_bound            int64                       
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.item
(
    i_item_sk                 int64               not null,
    i_item_id                 string              not null,
    i_rec_start_date          date                          ,
    i_rec_end_date            date                          ,
    i_item_desc               string                  ,
    i_current_price           float64                  ,
    i_wholesale_cost          float64                  ,
    i_brand_id                int64                       ,
    i_brand                   string                      ,
    i_class_id                int64                       ,
    i_class                   string                      ,
    i_category_id             int64                       ,
    i_category                string                      ,
    i_manufact_id             int64                       ,
    i_manufact                string                      ,
    i_size                    string                      ,
    i_formulation             string                      ,
    i_color                   string                      ,
    i_units                   string                      ,
    i_container               string                      ,
    i_manager_id              int64                       ,
    i_product_name            string                      
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.store
(
    s_store_sk                int64               not null,
    s_store_id                string              not null,
    s_rec_start_date          date                          ,
    s_rec_end_date            date                          ,
    s_closed_date_sk          int64                       ,
    s_store_name              string                   ,
    s_number_employees        int64                       ,
    s_floor_space             int64                       ,
    s_hours                   string                      ,
    s_manager                 string                   ,
    s_market_id               int64                       ,
    s_geography_class         string                  ,
    s_market_desc             string                  ,
    s_market_manager          string                   ,
    s_division_id             int64                       ,
    s_division_name           string                   ,
    s_company_id              int64                       ,
    s_company_name            string                   ,
    s_street_number           string                   ,
    s_street_name             string                   ,
    s_street_type             string                      ,
    s_suite_number            string                      ,
    s_city                    string                   ,
    s_county                  string                   ,
    s_state                   string                       ,
    s_zip                     string                      ,
    s_country                 string                   ,
    s_gmt_offset              float64                  ,
    s_tax_precentage          float64                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.call_center
(
    cc_call_center_sk         int64               not null,
    cc_call_center_id         string              not null,
    cc_rec_start_date         date                          ,
    cc_rec_end_date           date                          ,
    cc_closed_date_sk         int64                       ,
    cc_open_date_sk           int64                       ,
    cc_name                   string                   ,
    cc_class                  string                   ,
    cc_employees              int64                       ,
    cc_sq_ft                  int64                       ,
    cc_hours                  string                      ,
    cc_manager                string                   ,
    cc_mkt_id                 int64                       ,
    cc_mkt_class              string                      ,
    cc_mkt_desc               string                  ,
    cc_market_manager         string                   ,
    cc_division               int64                       ,
    cc_division_name          string                   ,
    cc_company                int64                       ,
    cc_company_name           string                      ,
    cc_street_number          string                      ,
    cc_street_name            string                   ,
    cc_street_type            string                      ,
    cc_suite_number           string                      ,
    cc_city                   string                   ,
    cc_county                 string                   ,
    cc_state                  string                       ,
    cc_zip                    string                      ,
    cc_country                string                   ,
    cc_gmt_offset             float64                  ,
    cc_tax_percentage         float64                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.customer
(
    c_customer_sk             int64               not null,
    c_customer_id             string              not null,
    c_current_cdemo_sk        int64                       ,
    c_current_hdemo_sk        int64                       ,
    c_current_addr_sk         int64                       ,
    c_first_shipto_date_sk    int64                       ,
    c_first_sales_date_sk     int64                       ,
    c_salutation              string                      ,
    c_first_name              string                      ,
    c_last_name               string                      ,
    c_preferred_cust_flag     string                       ,
    c_birth_day               int64                       ,
    c_birth_month             int64                       ,
    c_birth_year              int64                       ,
    c_birth_country           string                   ,
    c_login                   string                      ,
    c_email_address           string                      ,
    c_last_review_date        string                      
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.web_site
(
    web_site_sk               int64               not null,
    web_site_id               string              not null,
    web_rec_start_date        date                          ,
    web_rec_end_date          date                          ,
    web_name                  string                   ,
    web_open_date_sk          int64                       ,
    web_close_date_sk         int64                       ,
    web_class                 string                   ,
    web_manager               string                   ,
    web_mkt_id                int64                       ,
    web_mkt_class             string                   ,
    web_mkt_desc              string                  ,
    web_market_manager        string                   ,
    web_company_id            int64                       ,
    web_company_name          string                      ,
    web_street_number         string                      ,
    web_street_name           string                   ,
    web_street_type           string                      ,
    web_suite_number          string                      ,
    web_city                  string                   ,
    web_county                string                   ,
    web_state                 string                       ,
    web_zip                   string                      ,
    web_country               string                   ,
    web_gmt_offset            float64                  ,
    web_tax_percentage        float64                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.store_returns
(
    sr_returned_date_sk       int64                       ,
    sr_return_time_sk         int64                       ,
    sr_item_sk                int64               not null,
    sr_customer_sk            int64                       ,
    sr_cdemo_sk               int64                       ,
    sr_hdemo_sk               int64                       ,
    sr_addr_sk                int64                       ,
    sr_store_sk               int64                       ,
    sr_reason_sk              int64                       ,
    sr_ticket_number          int64               not null,
    sr_return_quantity        int64                       ,
    sr_return_amt             float64                  ,
    sr_return_tax             float64                  ,
    sr_return_amt_inc_tax     float64                  ,
    sr_fee                    float64                  ,
    sr_return_ship_cost       float64                  ,
    sr_refunded_cash          float64                  ,
    sr_reversed_charge        float64                  ,
    sr_store_credit           float64                  ,
    sr_net_loss               float64                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.household_demographics
(
    hd_demo_sk                int64               not null,
    hd_income_band_sk         int64                       ,
    hd_buy_potential          string                      ,
    hd_dep_count              int64                       ,
    hd_vehicle_count          int64                       
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.web_page
(
    wp_web_page_sk            int64               not null,
    wp_web_page_id            string              not null,
    wp_rec_start_date         date                          ,
    wp_rec_end_date           date                          ,
    wp_creation_date_sk       int64                       ,
    wp_access_date_sk         int64                       ,
    wp_autogen_flag           string                       ,
    wp_customer_sk            int64                       ,
    wp_url                    string                  ,
    wp_type                   string                      ,
    wp_char_count             int64                       ,
    wp_link_count             int64                       ,
    wp_image_count            int64                       ,
    wp_max_ad_count           int64                       
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.promotion
(
    p_promo_sk                int64               not null,
    p_promo_id                string              not null,
    p_start_date_sk           int64                       ,
    p_end_date_sk             int64                       ,
    p_item_sk                 int64                       ,
    p_cost                    float64                 ,
    p_response_target         int64                       ,
    p_promo_name              string                      ,
    p_channel_dmail           string                       ,
    p_channel_email           string                       ,
    p_channel_catalog         string                       ,
    p_channel_tv              string                       ,
    p_channel_radio           string                       ,
    p_channel_press           string                       ,
    p_channel_event           string                       ,
    p_channel_demo            string                       ,
    p_channel_details         string                  ,
    p_purpose                 string                      ,
    p_discount_active         string                       
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_page
(
    cp_catalog_page_sk        int64               not null,
    cp_catalog_page_id        string              not null,
    cp_start_date_sk          int64                       ,
    cp_end_date_sk            int64                       ,
    cp_department             string                   ,
    cp_catalog_number         int64                       ,
    cp_catalog_page_number    int64                       ,
    cp_description            string                  ,
    cp_type                   string                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.inventory
(
    inv_date_sk               int64               not null,
    inv_item_sk               int64               not null,
    inv_warehouse_sk          int64               not null,
    inv_quantity_on_hand      int64                       
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_returns
(
    cr_returned_date_sk       int64                       ,
    cr_returned_time_sk       int64                       ,
    cr_item_sk                int64               not null,
    cr_refunded_customer_sk   int64                       ,
    cr_refunded_cdemo_sk      int64                       ,
    cr_refunded_hdemo_sk      int64                       ,
    cr_refunded_addr_sk       int64                       ,
    cr_returning_customer_sk  int64                       ,
    cr_returning_cdemo_sk     int64                       ,
    cr_returning_hdemo_sk     int64                       ,
    cr_returning_addr_sk      int64                       ,
    cr_call_center_sk         int64                       ,
    cr_catalog_page_sk        int64                       ,
    cr_ship_mode_sk           int64                       ,
    cr_warehouse_sk           int64                       ,
    cr_reason_sk              int64                       ,
    cr_order_number           int64               not null,
    cr_return_quantity        int64                       ,
    cr_return_amount          float64                  ,
    cr_return_tax             float64                  ,
    cr_return_amt_inc_tax     float64                  ,
    cr_fee                    float64                  ,
    cr_return_ship_cost       float64                  ,
    cr_refunded_cash          float64                  ,
    cr_reversed_charge        float64                  ,
    cr_store_credit           float64                  ,
    cr_net_loss               float64                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.web_returns
(
    wr_returned_date_sk       int64                       ,
    wr_returned_time_sk       int64                       ,
    wr_item_sk                int64               not null,
    wr_refunded_customer_sk   int64                       ,
    wr_refunded_cdemo_sk      int64                       ,
    wr_refunded_hdemo_sk      int64                       ,
    wr_refunded_addr_sk       int64                       ,
    wr_returning_customer_sk  int64                       ,
    wr_returning_cdemo_sk     int64                       ,
    wr_returning_hdemo_sk     int64                       ,
    wr_returning_addr_sk      int64                       ,
    wr_web_page_sk            int64                       ,
    wr_reason_sk              int64                       ,
    wr_order_number           int64               not null,
    wr_return_quantity        int64                       ,
    wr_return_amt             float64                  ,
    wr_return_tax             float64                  ,
    wr_return_amt_inc_tax     float64                  ,
    wr_fee                    float64                  ,
    wr_return_ship_cost       float64                  ,
    wr_refunded_cash          float64                  ,
    wr_reversed_charge        float64                  ,
    wr_account_credit         float64                  ,
    wr_net_loss               float64                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.web_sales
(
    ws_sold_date_sk           int64                       ,
    ws_sold_time_sk           int64                       ,
    ws_ship_date_sk           int64                       ,
    ws_item_sk                int64               not null,
    ws_bill_customer_sk       int64                       ,
    ws_bill_cdemo_sk          int64                       ,
    ws_bill_hdemo_sk          int64                       ,
    ws_bill_addr_sk           int64                       ,
    ws_ship_customer_sk       int64                       ,
    ws_ship_cdemo_sk          int64                       ,
    ws_ship_hdemo_sk          int64                       ,
    ws_ship_addr_sk           int64                       ,
    ws_web_page_sk            int64                       ,
    ws_web_site_sk            int64                       ,
    ws_ship_mode_sk           int64                       ,
    ws_warehouse_sk           int64                       ,
    ws_promo_sk               int64                       ,
    ws_order_number           int64               not null,
    ws_quantity               int64                       ,
    ws_wholesale_cost         float64                  ,
    ws_list_price             float64                  ,
    ws_sales_price            float64                  ,
    ws_ext_discount_amt       float64                  ,
    ws_ext_sales_price        float64                  ,
    ws_ext_wholesale_cost     float64                  ,
    ws_ext_list_price         float64                  ,
    ws_ext_tax                float64                  ,
    ws_coupon_amt             float64                  ,
    ws_ext_ship_cost          float64                  ,
    ws_net_paid               float64                  ,
    ws_net_paid_inc_tax       float64                  ,
    ws_net_paid_inc_ship      float64                  ,
    ws_net_paid_inc_ship_tax  float64                  ,
    ws_net_profit             float64                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.catalog_sales
(
    cs_sold_date_sk           int64                       ,
    cs_sold_time_sk           int64                       ,
    cs_ship_date_sk           int64                       ,
    cs_bill_customer_sk       int64                       ,
    cs_bill_cdemo_sk          int64                       ,
    cs_bill_hdemo_sk          int64                       ,
    cs_bill_addr_sk           int64                       ,
    cs_ship_customer_sk       int64                       ,
    cs_ship_cdemo_sk          int64                       ,
    cs_ship_hdemo_sk          int64                       ,
    cs_ship_addr_sk           int64                       ,
    cs_call_center_sk         int64                       ,
    cs_catalog_page_sk        int64                       ,
    cs_ship_mode_sk           int64                       ,
    cs_warehouse_sk           int64                       ,
    cs_item_sk                int64               not null,
    cs_promo_sk               int64                       ,
    cs_order_number           int64               not null,
    cs_quantity               int64                       ,
    cs_wholesale_cost         float64                  ,
    cs_list_price             float64                  ,
    cs_sales_price            float64                  ,
    cs_ext_discount_amt       float64                  ,
    cs_ext_sales_price        float64                  ,
    cs_ext_wholesale_cost     float64                  ,
    cs_ext_list_price         float64                  ,
    cs_ext_tax                float64                  ,
    cs_coupon_amt             float64                  ,
    cs_ext_ship_cost          float64                  ,
    cs_net_paid               float64                  ,
    cs_net_paid_inc_tax       float64                  ,
    cs_net_paid_inc_ship      float64                  ,
    cs_net_paid_inc_ship_tax  float64                  ,
    cs_net_profit             float64                  
);

create table {{tpc_schema_prefix}}_{{tpc_scale}}.store_sales
(
    ss_sold_date_sk           int64                       ,
    ss_sold_time_sk           int64                       ,
    ss_item_sk                int64               not null,
    ss_customer_sk            int64                       ,
    ss_cdemo_sk               int64                       ,
    ss_hdemo_sk               int64                       ,
    ss_addr_sk                int64                       ,
    ss_store_sk               int64                       ,
    ss_promo_sk               int64                       ,
    ss_ticket_number          int64               not null,
    ss_quantity               int64                       ,
    ss_wholesale_cost         float64                  ,
    ss_list_price             float64                  ,
    ss_sales_price            float64                  ,
    ss_ext_discount_amt       float64                  ,
    ss_ext_sales_price        float64                  ,
    ss_ext_wholesale_cost     float64                  ,
    ss_ext_list_price         float64                  ,
    ss_ext_tax                float64                  ,
    ss_coupon_amt             float64                  ,
    ss_net_paid               float64                  ,
    ss_net_paid_inc_tax       float64                  ,
    ss_net_profit             float64                  
);
