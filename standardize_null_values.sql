----------// STANDARDIZE PRODUCT CATEGORY//--------------
---610 null values are standardize using COALESCE-----------


CREATE TABLE cleaned_products AS
SELECT product_id,
COALESCE(product_category_name, 'unknown') AS product_category_name,
product_name_length,
product_description_length,
product_photos_qty,
product_weight_g,
product_length_cm,
product_height_cm,
product_width_cm

FROM raw_products;
