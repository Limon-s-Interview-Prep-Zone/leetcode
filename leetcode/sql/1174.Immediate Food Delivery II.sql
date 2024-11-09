-- Write your PostgreSQL query statement below
WITH FirstOrders AS (
-- 1
    SELECT 
        customer_id, 
        MIN(order_date) AS first_order_date
    FROM 
        delivery
    GROUP BY 
        customer_id
)
SELECT ROUND(AVG((d.order_date=d.customer_pref_delivery_date)::INT4)*100, 2) as immediate_percentage --3
FROM Delivery as d--2
JOIN FirstOrders as fo 
ON d.customer_id=fo.customer_id AND d.order_date=fo.first_order_date;

--or
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN order_date = preferred_delivery_date THEN 1 ELSE 0 END) 
        / COUNT(*), 
        2
    ) AS immediate_order_percentage
FROM 
    Orders
WHERE 
    (customer_id, order_date) IN (
        SELECT 
            customer_id, 
            MIN(order_date)
        FROM 
            Orders
        GROUP BY 
            customer_id
    );
