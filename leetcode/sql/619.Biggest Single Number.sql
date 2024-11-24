# Write your MySQL query statement below
SELECT max(p.num) as 'num' FROM (
    SELECT MAX(num) as 'num', count(*) as level FROM MyNumbers
GROUP BY num
Having level=1
) as p