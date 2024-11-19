-- Write your PostgreSQL query statement below
SELECT sell_date, Count(DISTINCT(product)) as num_sold, 
STRING_AGG(DISTINCT(product), ',' ORDER BY product) as products FROM Activities
GROUP BY sell_date