SELECT 
    line_items.oreder_item_key,
    line_items.part_key,
    line_items.line_number,
    line_items.extended_price,
    orders.order_key,
    orders.customer_key,
    orders.order_date,
    {{ discounted_amount('line_items.extended_price', 'line_items.discount') }} as item_discount

FROM {{ ref('stg_tpch_orders') }} as orders
JOIN {{ ref('stg_tpch_line_items') }} as line_items
    ON orders.order_key = line_items.order_key

ORDER BY orders.order_date