{{config(materialized='incremental')}}

select * from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
where to_time(concat(t_hour:: varchar,':',T_MINUTE::varchar,':',T_SECOND::varchar))  <= current_time

{% if is_incremental()%}
and to_time(concat(t_hour:: varchar,':',T_MINUTE::varchar,':',T_SECOND::varchar)) >=
(select max(to_time(concat(t_hour:: varchar,':',T_MINUTE::varchar,':',T_SECOND::varchar)))
from {{ this }}
)
{% endif %}
