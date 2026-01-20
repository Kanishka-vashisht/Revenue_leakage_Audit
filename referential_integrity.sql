-------------// REFERENTIAL INTEGRITY//------------------------

---Referential integrity ensures that relationships between tables are consistent and there is no orphan records exist that can lead to analysis errors----

--This step is very critical as dues to factors like manual data corrections or partial loads issues like orphan records can be created which further affects in KPI calculations, data analysis, audit outcomes, revenue calculations etc.---

---Zero orphan records indicated healthy data relationships-----

--------FINDING ORPHAN ORDERS-----------

SELECT COUNT(*) as orphan_orders
from raw_order_items oi
left join raw_orders o on
o.order_id = oi.order_id
where o.order_id is null ;

---------FINDING ORDERS WITHOUT CUSTOMERS----------

SELECT COUNT(*) AS ORDER_WITHOUT_CUSTOMER
FROM raw_orders o
left join raw_customers c on
o.customer_id = c.customer_id
where c.customer_id is null; 

----------FINDING ORDERS WITHOUT PAYMENT-------------

SELECT COUNT(DISTINCT o.order_id) AS order_without_payment
from raw_orders o
left join raw_payments p
on p.order_id = o.order_id
where p.order_id is null
AND o.order_status NOT IN('cancelled','unavailable');

------------FINDING ORDERS WITHOUT PRODUCT---------------

SELECT COUNT(*) AS ORDER_WITHOUT_PRODUCT
FROM raw_order_items oi
left join cleaned_products cp
on cp.product_id = oi.product_id
where cp.product_id is null;

--------- With this analysis we found one unpaid delivered order-------
