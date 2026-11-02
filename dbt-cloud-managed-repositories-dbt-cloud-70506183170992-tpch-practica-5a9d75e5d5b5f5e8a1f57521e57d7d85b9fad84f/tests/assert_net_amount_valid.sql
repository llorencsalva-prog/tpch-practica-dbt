-- Falla si algún importe neto es negativo o mayor que el bruto
select *
from {{ ref('fct_sales') }}
where net_amount < 0
   or net_amount > gross_amount