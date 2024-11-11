-- Write your PostgreSQL query statement below
SELECT activity_date as day, COUNT(DISTINCT(user_id)) as active_users
FROM Activity
WHERE '2019-07-27'- activity_date <30 AND activity_date<='2019-07-27'
GROUP BY activity_date
HAVING COUNT(DISTINCT user_id) > 0



/* Write your T-SQL query statement below */
SELECT activity_date as day, COUNT(DISTINCT(user_id)) as active_users
FROM Activity
WHERE DATEDIFF(day,activity_date,'2019-07-27')<30 AND activity_date<='2019-07-27'
GROUP BY activity_date
HAVING COUNT(DISTINCT user_id) > 0