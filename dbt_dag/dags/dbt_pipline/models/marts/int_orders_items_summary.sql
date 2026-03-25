select
    order_key,
    sum(extended_price) as gross_item_sales_amount,
    sum(item_discount) as item_discount
from {{ ref('int_orders_items') }}
group by order_key