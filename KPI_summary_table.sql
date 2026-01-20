---------KPI SUMMARY TABLE -----------------
--It enables downstream visualization without reprocessing raw data---
----can be used to review audits------
---helps in analytical decision making--------

CREATE TABLE audit_KPI_summary AS
SELECT 
COUNT(DISTINCT o.order_id) AS total_orders, 
COUNT(DISTINCT p.order_id) AS total_paid_orders,
Count(DISTINCT rl.order_id) AS leaked_orders,
ROUND(
COUNT(DISTINCT rl.order_id)::numeric/COUNT(DISTINCT o.order_id) * 100,2) AS leakage_percentage,
SUM(rl.order_value) AS net_financial_loss
from raw_orders o
LEFT JOIN raw_payments p
on o.order_id = p.order_id
LEFT JOIN revenue_leakage_orders rl
on o.order_id = rl.order_id;
