-- Write your PostgreSQL query statement below
SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month, country, COUNT(id) as trans_count, 
SUM((state='approved')::int4) as approved_count,
sum(amount) as trans_total_amount,
sum(CASE WHEN state='approved' then amount else 0 END) as approved_total_amount
FROM Transactions
GROUP BY month, country