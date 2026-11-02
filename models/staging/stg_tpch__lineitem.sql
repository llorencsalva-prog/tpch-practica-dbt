select
    l_orderkey                         as order_key,
    l_linenumber                       as line_number,
    l_partkey                          as part_key,
    l_suppkey                          as supplier_key,
    l_quantity::number(18,2)           as quantity,
    l_extendedprice::number(18,2)      as extended_price,
    l_discount::number(5,2)            as discount_pct,
    l_tax::number(5,2)                 as tax_pct,
    trim(l_returnflag)                 as return_flag,
    trim(l_linestatus)                 as line_status,
    l_shipdate                         as ship_date,
    l_commitdate                       as commit_date,
    l_receiptdate                      as receipt_date,
    trim(l_shipinstruct)               as ship_instructions,
    trim(l_shipmode)                   as ship_mode
from {{ source('tpch', 'lineitem') }}