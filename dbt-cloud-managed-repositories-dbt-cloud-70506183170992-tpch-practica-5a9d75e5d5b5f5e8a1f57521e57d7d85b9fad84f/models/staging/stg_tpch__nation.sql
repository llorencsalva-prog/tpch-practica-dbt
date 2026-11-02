select
    n_nationkey                  as nation_key,
    trim(n_name)                 as nation_name,
    n_regionkey                  as region_key
from {{ source('tpch', 'nation') }}