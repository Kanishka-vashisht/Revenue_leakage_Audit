----------------// RAW DATA//-------------------------

-------------------ORDER TABLE------------------------

CREATE TABLE raw_orders (
  order_id TEXT,
  customer_id TEXT,
  order_status TEXT,
  order_purchase_timestamp TIMESTAMP,
  order_approved_at TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP
);

-----------------PAYMENT TABLE------------------------
CREATE TABLE raw_payments (
  order_id TEXT,
  payment_sequential INT,
  payment_type TEXT,
  payment_installments INT,
  payment_value NUMERIC
);

-----------------ORDER ITEMS TABLE--------------------

CREATE TABLE raw_order_items (
  order_id TEXT,
  order_item_id INT,
  product_id TEXT,
  seller_id TEXT,
  shipping_limit_date TIMESTAMP,
  price NUMERIC,
  freight_value NUMERIC
);

------------------CUSTOMERS TABLE--------------------

CREATE TABLE raw_customers (
  customer_id TEXT,
  customer_unique_id TEXT,
  customer_zip_code_prefix INT,
  customer_city TEXT,
  customer_state TEXT
);

-------------------PRODUCTS TABLE-------------------

CREATE TABLE raw_products (
  product_id TEXT,
  product_category_name TEXT,
  product_name_length INT,
  product_description_length INT,
  product_photos_qty INT,
  product_weight_g INT,
  product_length_cm INT,
  product_height_cm INT,
  product_width_cm INT
);
