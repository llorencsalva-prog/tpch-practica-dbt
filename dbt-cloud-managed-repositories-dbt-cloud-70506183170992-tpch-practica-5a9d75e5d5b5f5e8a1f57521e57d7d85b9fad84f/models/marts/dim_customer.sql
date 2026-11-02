select
    customer_key,
    customer_name,
    market_segment,
    account_balance,
    nation_name,
    region_name
from {{ ref('int_customers_enriched') }}