-- Write your PostgreSQL query statement below
Select e.name as Employee from Employee as e
full join Employee se on e.managerId=se.Id
where e.salary>se.salary

Select e.name as Employee from Employee as e
where e.salary>(Select salary FROM Employee
    WHERE Id = e.managerId)
