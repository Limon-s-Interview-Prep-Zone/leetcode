SELECT 
    user_id, 
     CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2, Length(name)))) AS name
FROM 
    Users
ORDER BY user_id