{% macro calc_net_amount(price_col, discount_col, decimals=2) -%}
    round({{ price_col }} * (1 - {{ discount_col }}), {{ decimals }})
{%- endmacro %}