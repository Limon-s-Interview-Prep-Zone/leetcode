-- Write your PostgreSQL query statement below

SELECT e.employee_id, e.name, emp.reports_count, emp.average_age
 FROM Employees as e
    JOIN
(SELECT reports_to, Count(reports_to) as reports_count, 
ROUND(AVG(age)) as average_age
FROM Employees
WHERE reports_to is not null
GROUP BY reports_to) as emp
ON e.employee_id=emp.reports_to
ORDER BY e.employee_id