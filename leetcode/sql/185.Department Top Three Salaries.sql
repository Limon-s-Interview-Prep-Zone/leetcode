-- Write your PostgreSQL query statement below
WITH EmployeeRank as (
    SELECT d.name as Department, e.name, e.salary,
        dense_rank() OVER (
            Partition by e.departmentId ORDER BY e.salary DESC
        ) as level FROM Employee as e
    JOIN Department as d
        ON e.departmentId = d.id
)

Select department as  Department, name as Employee, salary as Salary
    from EmployeeRank
where level<4




/*
| department | name  | salary | level |
| ---------- | ----- | ------ | ----- |
| IT         | Max   | 90000  | 1     |
| IT         | Joe   | 85000  | 2     |
| IT         | Randy | 85000  | 2     |
| IT         | Will  | 70000  | 3     |
| IT         | Janet | 69000  | 4     |
| Sales      | Henry | 80000  | 1     |
| Sales      | Sam   | 60000  | 2     |
*/