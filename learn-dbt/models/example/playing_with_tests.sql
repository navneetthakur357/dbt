{{ config(materialized= 'table')}}


select * from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF001"."CUSTOMER"
