select
    s_suppkey                    as supplier_key,
    trim(s_name)                 as supplier_name,
    trim(s_address)              as supplier_address,
    s_nationkey                  as nation_key,
    trim(s_phone)                as phone,
    s_acctbal::number(18,2)      as account_balance
from {{ source('tpch', 'supplier') }}