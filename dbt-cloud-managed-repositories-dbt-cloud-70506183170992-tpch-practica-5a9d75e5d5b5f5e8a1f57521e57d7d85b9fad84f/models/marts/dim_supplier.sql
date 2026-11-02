select
    supplier_key,
    supplier_name,
    account_balance,
    nation_name,
    region_name
from {{ ref('int_suppliers_enriched') }}