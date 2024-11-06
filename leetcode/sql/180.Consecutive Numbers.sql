/*
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/

-- Write your PostgreSQL query statement below
WITH ConsecutiveCheck AS (
    SELECT 
        num,
        LAG(num, 1)  OVER(ORDER BY id) AS pre_num,
        LEAD(num, 1)  OVER(ORDER BY id) AS next_num
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums FROM ConsecutiveCheck
WHERE num=pre_num AND num=next_num

/*
| Id | Num | prev_num | next_num |
|----|-----|----------|----------|
| 1  | 1   | NULL     | 1        |
| 2  | 1   | 1        | 1        |
| 3  | 1   | 1        | 2        |
| 4  | 2   | 1        | 1        |
| 5  | 1   | 2        | 2        |
| 6  | 2   | 1        | 2        |
| 7  | 2   | 2        | NULL     |
*/

--using LEAD
WITH ConsecutiveCheck AS (
    SELECT 
        num,
        LAG(num, 1)  OVER(ORDER BY id) AS prev_num,
        LAG(num, 2)  OVER(ORDER BY id) AS prev_num_prev
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums FROM ConsecutiveCheck
WHERE num=prev_num AND num=prev_num_prev

/*
| Id  | Num | prev_num | prev_prev_num |
|-----|-----|----------|----------------|
| 1   | 1   | NULL     | NULL           |
| 2   | 1   | 1        | NULL           |
| 3   | 1   | 1        | 1              |
| 4   | 2   | 1        | 1              |
| 5   | 1   | 2        | 1              |
| 6   | 2   | 1        | 2              |
| 7   | 2   | 2        | 1              |
*/

