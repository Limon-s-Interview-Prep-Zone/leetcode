-- Write your PostgreSQL query statement below
SELECT score, DENSE_RANK() over (ORDER BY score DESC) rank 
FROM Scores