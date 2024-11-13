-- Write your PostgreSQL query statement below
WITH Confirms AS(
    SELECT user_id,
        -- SUM(CASE WHEN action='confirmed' THEN 1 ELSE 0 END) as confirm,
        COUNT(*) filter(where action='confirmed') as confirm,
        COUNT(*) as total
    FROM Confirmations GROUP BY user_id
)
SELECT s.user_id, 
   ROUND(COALESCE(CAST(c.confirm AS NUMERIC) / NULLIF(c.total, 0), 0), 2) AS confirmation_rate

FROM Signups as s
LEFT JOIN Confirms as c
ON c.user_id=s.user_id
ORDER BY confirmation_rate asc