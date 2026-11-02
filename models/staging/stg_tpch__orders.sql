{{ config(
    materialized = 'incremental',
    unique_key = 'order_key',
    incremental_strategy = 'merge',
    on_schema_change = 'append_new_columns'
) }}

select
    o_orderkey                        as order_key,
    o_custkey                         as customer_key,
    trim(o_orderstatus)               as order_status_code,
    o_totalprice::number(18,2)        as total_price,
    o_orderdate                       as order_date,
    trim(o_orderpriority)             as order_priority,
    trim(o_clerk)                     as clerk,
    o_shippriority                    as ship_priority,
    current_timestamp()               as _loaded_at
from {{ source('tpch', 'orders') }}

{% if is_incremental() %}
  -- solo pedidos nuevos (con 3 días de margen para cambios tardíos)
  where o_orderdate >= (select dateadd(day, -3, max(order_date)) from {{ this }})
{% endif %}