SELECT * 
from {{ ref('fact_orders') }}
where item_discount > 0
