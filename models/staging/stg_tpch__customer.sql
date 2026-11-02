select
    c_custkey                    as customer_key,
    trim(c_name)                 as customer_name,
    trim(c_address)              as customer_address,
    c_nationkey                  as nation_key,
    trim(c_phone)                as phone,
    c_acctbal::number(18,2)      as account_balance,
    trim(c_mktsegment)           as market_segment
from {{ source('tpch', 'customer') }}