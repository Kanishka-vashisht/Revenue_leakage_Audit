-----------// REVENUE LEAKAGE ORDERS TABLE  //------------------

----This table has all the necessary information required for all the missing payment orders. it can be used to make effective dashboards and can be used to form strong business decisions.------------------

----It shows net financial loss, what is the leakage type of the order and all other necessary information.------

CREATE TABLE revenue_leakage_orders AS
SELECT
o.order_id,
o.customer_id,
o.order_status,
o.order_purchase_timestamp,
o.order_delivered_customer_date,
COUNT(oi.order_item_id) AS total_items,
SUM(oi.price + oi.freight_value) AS order_value,
'UNPAID_DELIVERED_ORDER' AS leakage_type
FROM raw_orders o
JOIN raw_order_items oi
ON o.order_id = oi.order_id
LEFT JOIN raw_payments p
ON o.order_id = p.order_id
WHERE p.order_id IS NULL
AND o.order_status NOT IN ('canceled', 'unavailable')
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY
o.order_id,
o.customer_id,
o.order_status,
o.order_purchase_timestamp,
o.order_delivered_customer_date;
--------REVENUE LEAKAGE TABLE-----------
SELECT * FROM revenue_leakage_orders;