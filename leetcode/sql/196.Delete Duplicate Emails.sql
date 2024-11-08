--sql server
DELETE p1 from Person as p1
join Person as p2 ON p1.email=p2.email
where p1.id>p2.id

DELETE p FROM Person p WHERE 
p.id NOT IN( SELECT min(id) FROM Person 
GROUP BY email)

--postgresql
DELETE 
FROM Person p1
using Person p2 
WHERE p1.Email = p2.Email AND p1.Id > p2.Id;

---
DELETE FROM Person WHERE 
id NOT IN( SELECT min(id) FROM Person 
GROUP BY email)