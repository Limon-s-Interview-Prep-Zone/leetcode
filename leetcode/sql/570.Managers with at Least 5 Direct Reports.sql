-- Write your PostgreSQL query statement below
WITH ManagerReport AS(
    SELECT managerId, COUNT(managerId) as cnt 
    FROM Employee WHERE managerId is NOT NULL
    Group By managerId
    HAVING COUNT(managerId)>=5
)
SELECT e.name FROM  Employee as e join ManagerReport as m 
on m.managerId=e.id

/* Consideration:
1. the above query will create a materialized tables
    1. Solution: use inline query
2. COUNT(managerId) will check for non null values
    1. Solution : COUNT(*)
*/
--optimal
SELECT e.name FROM  Employee as e 
join
    (SELECT managerId 
    FROM Employee WHERE managerId is NOT NULL
    Group By managerId
    HAVING COUNT(*)>=5
    ) as m 
on m.managerId=e.id