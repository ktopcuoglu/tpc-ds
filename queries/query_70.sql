
select  
    sum(ss_net_profit) as total_sum
   ,s_state
   ,s_county
   ,rank() over (
  partition by s_state,s_county order by sum(ss_net_profit) desc) as rank_within_parent
 from
    {{tpc_schema}}.store_sales
   ,{{tpc_schema}}.date_dim       d1
   ,{{tpc_schema}}.store
 where
    d1.d_month_seq between 1212 and 1212+11
 and d1.d_date_sk = ss_sold_date_sk
 and s_store_sk  = ss_store_sk
 and s_state in
             ( select s_state
               from  (select s_state as s_state,
        rank() over ( partition by s_state order by sum(ss_net_profit) desc) as ranking
                      from   {{tpc_schema}}.store_sales, {{tpc_schema}}.store, {{tpc_schema}}.date_dim
                      where  d_month_seq between 1212 and 1212+11
        and d_date_sk = ss_sold_date_sk
        and s_store_sk  = ss_store_sk
                      group by s_state
                     ) tmp1 
               where ranking <= 5
             )
 group by s_state,s_county
 order by s_state,s_county,rank_within_parent
 limit 100;


