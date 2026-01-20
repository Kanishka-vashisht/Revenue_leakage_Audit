--------Data Quality Audit – Null Checks----------------

---------Conducted null value analysis across all raw tables to identify missing critical fields that could lead to revenue leakage, incorrect KPI calculations, and biased insights. Conditional nulls were identified based on order lifecycle stages.---------

----(orders)----

SELECT 
COUNT(*) AS TOTAL_ROWS,

COUNT(*)FILTER
(WHERE order_id IS NULL) AS Null_order_id,
COUNT(*)FILTER
(WHERE customer_id IS NULL) AS Null_customer_id,
COUNT(*)FILTER
(WHERE order_status IS NULL) AS NuLL_order_status,
COUNT(*)FILTER
(WHERE order_purchase_timestamp IS NULL) AS Null_order_purchase_timestamp,
COUNT(*)FILTER
(WHERE order_estimated_delivery_date IS NULL) AS Null_order_estimated_delivery_date

FROM raw_orders;

-------(payments)------------

SELECT 
COUNT(*) AS TOTAL_ROWS,

COUNT(*)FILTER(WHERE order_id IS NULL) AS Null_order_id,
COUNT(*)FILTER(WHERE payment_type IS NULL) AS Null_payment_type,
COUNT(*) FILTER (WHERE payment_installments IS NULL) AS null_installments,
COUNT(*)FILTER(WHERE payment_value IS NULL)AS Null_payment_value

FROM raw_payments;

------------(order Items)----------------

SELECT 
COUNT(*) AS TOTAL_ROWS,

COUNT(*)FILTER
(WHERE order_id IS NULL) AS Null_order_id,
COUNT(*)FILTER
(WHERE order_item_id IS NULL)AS Null_order_item_id,
COUNT(*)FILTER
(WHERE product_id IS NULL)AS Null_product_id, 
COUNT(*)FILTER
(WHERE price IS NULL)AS Null_price,
COUNT(*)FILTER
(WHERE seller_id IS NULL)AS Null_seller_id,
COUNT(*)FILTER
(WHERE shipping_limit_date IS NULL)AS Null_shipping_limit_date,
COUNT(*)FILTER
(WHERE freight_value IS NULL)AS Null_freight_value

FROM raw_order_items;

------------(customers)---------------

SELECT 
COUNT(*) AS TOTAL_ROWS,

COUNT(*)FILTER
(WHERE customer_id IS NULL) AS Null_customer_id,
COUNT(*)FILTER
(WHERE customer_unique_id IS NULL) AS Null_customer_unique_id,
COUNT(*)FILTER
(WHERE customer_city IS NULL) AS Null_customer_city,
COUNT(*)FILTER
(WHERE customer_state IS NULL) AS Null_customer_state,
COUNT(*)FILTER
(WHERE customer_zip_code_prefix IS NULL) AS Null_customer_zip_code_prefix

FROM raw_customers;


---------(products)---------------
SELECT
COUNT(*) AS total_rows,

COUNT(*) FILTER 
(WHERE product_id IS NULL) AS null_product_id,
COUNT(*) FILTER
(WHERE product_category_name IS NULL) AS null_category

FROM raw_products;

-------------RESULT----------------
610 null values found in product category column.

