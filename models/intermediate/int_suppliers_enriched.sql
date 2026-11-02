select
    s.supplier_key,
    s.supplier_name,
    s.account_balance,
    n.nation_name,
    r.region_name
from {{ ref('stg_tpch__supplier') }} s
left join {{ ref('stg_tpch__nation') }} n on s.nation_key = n.nation_key
left join {{ ref('stg_tpch__region') }} r on n.region_key = r.region_key