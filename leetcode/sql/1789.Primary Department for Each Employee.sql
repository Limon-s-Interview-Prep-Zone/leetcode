-- Write your PostgreSQL query statement below
WITH EmployeeWithRank as (SELECT 
        employee_id,
        department_id,
        primary_flag,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id 
            ORDER BY CASE WHEN primary_flag = 'Y' THEN 1 ELSE 2 END
            ) AS rnk
    FROM Employee
)
SELECT employee_id, department_id FROM EmployeeWithRank
WHERE rnk=1