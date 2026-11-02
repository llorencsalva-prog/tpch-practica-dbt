select
    c.customer_key,
    c.customer_name,
    c.market_segment,
    c.account_balance,
    n.nation_name,
    r.region_name
from {{ ref('stg_tpch__customer') }} c
left join {{ ref('stg_tpch__nation') }} n on c.nation_key = n.nation_key
left join {{ ref('stg_tpch__region') }} r on n.region_key = r.region_key