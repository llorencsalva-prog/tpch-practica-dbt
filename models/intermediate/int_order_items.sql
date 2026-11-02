with orders as (
    select * from {{ ref('stg_tpch__orders') }}
),
lineitem as (
    select * from {{ ref('stg_tpch__lineitem') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['l.order_key', 'l.line_number']) }} as order_item_key,
    l.order_key,
    l.line_number,
    o.customer_key,
    l.part_key,
    l.supplier_key,
    o.order_date,
    l.ship_date,
    l.commit_date,
    l.receipt_date,
    case o.order_status_code
        when 'F' then 'Fulfilled'
        when 'O' then 'Open'
        when 'P' then 'Partial'
    end                                                      as order_status,
    o.order_priority,
    l.ship_mode,
    l.return_flag,
    l.quantity,
    l.extended_price                                         as gross_amount,
    l.discount_pct,
    l.tax_pct,
    {{ calc_net_amount('l.extended_price', 'l.discount_pct') }} as net_amount,
    round({{ calc_net_amount('l.extended_price', 'l.discount_pct') }} * (1 + l.tax_pct), 2) as net_amount_with_tax,
    datediff(day, o.order_date, l.ship_date)                 as days_to_ship,
    iff(l.receipt_date > l.commit_date, true, false)         as is_late_delivery
from lineitem l
join orders o on l.order_key = o.order_key