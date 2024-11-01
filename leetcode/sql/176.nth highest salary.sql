CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    WITH RankedSalaries AS (
        SELECT Employee.salary, DENSE_RANK() OVER (
            ORDER BY Employee.salary DESC) AS SalaryRank
        FROM  Employee
    )
    SELECT MAX(RankedSalaries.salary) FROM RankedSalaries WHERE SalaryRank = N
  );
END;
$$ LANGUAGE plpgsql;


/*
---Test case:1
Employee=
| id | salary |
| -- | ------ |
| 1  | 100    |
| 2  | 100    |

Argument=1
| getNthHighestSalary(1) |
| ---------------------- |
| 100                    |

2: TestCase
| id | salary |
| -- | ------ |
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
Output
| getNthHighestSalary(2) |
| ---------------------- |
| 200                    |

3. Test-case:
| id | salary |
| -- | ------ |
| 1  | 100    |
output:
| getNthHighestSalary(2) |
| ---------------------- |
| null                   |
*/