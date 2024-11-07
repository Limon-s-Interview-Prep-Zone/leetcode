-- Write your PostgreSQL query statement below
WITH EmployeeWithMaxSalary as(
    SELECT D.name as dName, E.name , E.salary,
    RANK() OVER(
        PARTITION BY E.departmentId ORDER BY E.salary DESC
        ) as rank 
    FROM Employee as E
    JOIN Department as D
        ON E.departmentId= D.id
    ORDER BY E.id
)
SELECT dName as "Department", name as "Employee", salary as "Salary" 
    from EmployeeWithMaxSalary  
where rank = 1