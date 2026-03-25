SELECT 
    orders.*,
    order_item_summary.gross_item_sales_amount,
    order_item_summary.item_discount
FROM {{ ref('stg_tpch_orders') }} as orders
JOIN {{ ref('int_orders_items_summary') }} as order_item_summary
    ON orders.order_key = order_item_summary.order_key

ORDER BY orders.order_date