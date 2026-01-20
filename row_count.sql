----------------// ROW COUNT CHECK//-------------------------

----------Used to get an idea of the data volume-------------

SELECT 'raw_orders' AS table_name, COUNT(*) AS row_count FROM raw_orders
UNION ALL
SELECT 'raw_order_items', COUNT(*) FROM raw_order_items
UNION ALL
SELECT 'raw_payments', COUNT(*) FROM raw_payments
UNION ALL
SELECT 'raw_customers', COUNT(*) FROM raw_customers
UNION ALL
SELECT 'raw_products', COUNT(*) FROM raw_products;


----------------------RESULT-----------------------

raw_products : 32951
raw_payments : 103886
raw_customers : 99441
raw_orders : 99441
raw_order_items : 112650