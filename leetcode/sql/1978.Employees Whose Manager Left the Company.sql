-- Write your PostgreSQL query statement below
SELECT e1.employee_id
from Employees as e1
left join Employees as e2
ON e2.employee_id=e1.manager_id
WHERE 
    e1.manager_id is not null 
    and e2.employee_id is NULL 
    and e1.salary<30000
ORDER BY e1.employee_id

SELECT e.employee_id from Employees as e
where e.manager_id is not null and
 NOT EXISTS(SELECT 1 FROM Employees  as e1 where e.manager_id=e1.employee_id)
 and e.salary<30000
 ORDER BY e.employee_id

 SELECT employee_id
FROM Employees
WHERE manager_id IS NOT NULL 
  AND manager_id NOT IN (SELECT employee_id FROM Employees)
  AND salary<30000
Order by employee_id
