{{config(materialized='table')}}

select c.C_CUSTKEY,o.O_CUSTKEY , o.O_ORDERDATE--,count(o.O_ORDERKEY)
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
left outer join "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS" o
on c.C_CUSTKEY = o.O_CUSTKEY
Where
o.O_ORDERDATE	>= dateadd('month',-6,to_date('1998-08-02'))
order by 2 desc
