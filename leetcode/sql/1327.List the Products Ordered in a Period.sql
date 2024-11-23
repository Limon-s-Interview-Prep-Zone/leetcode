-- Write your PostgreSQL query statement below
SELECT p.product_name, SUM(o.unit) as unit from Products as p
JOIN Orders as o ON o.product_id=p.product_id
WHERE o.order_date between '2020-02-01' and '2020-02-29'
GROUP BY p.product_name
having sum(o.unit)>=100