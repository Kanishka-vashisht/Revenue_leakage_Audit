--Purpose: Fixing an order record with no corresponding
payment entry. It shows potential revenue leakage----------

---Bussiness context: Missing records my occur due to payment gateway failure, maybe order is under processing, partial ETL loads etc.
so, these orders needs to be flagged and properly categorized.------

-------Finding is the order is being delivered ------

SELECT o.order_id,
o.customer_id,
o.order_status,
o.order_purchase_timestamp,
o.order_approved_at,
o.order_delivered_customer_date
from raw_orders o
left join raw_payments p
on p.order_id = o.order_id
where p.order_id is null
and o.order_status not in('canceled','unavailable');

--------Finding the financial loss due to that order------

SELECT o.order_id,
o.order_status,
o.order_purchase_timestamp,
o.order_approved_at,
o.order_delivered_carrier_date,
o.order_delivered_customer_date,
o.order_estimated_delivery_date,

count( oi.order_item_id) as total_items,
sum(oi.price + oi.freight_value) as order_value
from raw_orders o
left join raw_order_items oi
on o.order_id = oi.order_id
left join raw_payments p
on o.order_id = p.order_id

where p.order_id is null 
and o.order_status not in('canceled','unavailable')

group by o.order_id,
o.order_status,
o.order_purchase_timestamp,
o.order_approved_at,
o.order_delivered_carrier_date,
o.order_delivered_customer_date,
o.order_estimated_delivery_date;
