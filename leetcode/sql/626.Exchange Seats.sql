-- Write your PostgreSQL query statement below
SELECT CASE 
    WHEN MOD(id,2)=1 and id+1<=(SELECT MAX(id) FROM Seat) then id+1
    WHEN MOD(id,2)=0 then id-1
    ELSE id
    END as id, 
student from Seat
Order by id