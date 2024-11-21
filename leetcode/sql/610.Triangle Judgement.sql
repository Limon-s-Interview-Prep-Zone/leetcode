-- Write your PostgreSQL query statement below
SELECT x, y, z,  (CASE WHEN abs(x+y)>abs(z) and abs(y+z)>abs(x) and
abs(x+z)>abs(y)
 then 'Yes' else 'No' END) as triangle 
from Triangle