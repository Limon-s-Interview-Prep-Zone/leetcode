--postgresql
SELECT s.student_id, s.student_name, sub.subject_name,
COALESCE(COUNT(ex.subject_name), 0) AS attended_exams
FROM Students as s
CROSS JOIN Subjects as sub
LEFT JOIN Examinations as ex
ON s.student_id= ex.student_id and ex.subject_name=sub.subject_name
GROUP BY s.student_id, sub.subject_name, s.student_name
ORDER BY s.student_id, sub.subject_name

/* Write your T-SQL query statement below */
SELECT s.student_id, s.student_name, sub.subject_name,
COALESCE(COUNT(ex.subject_name), 0) AS attended_exams
FROM Students as s
JOIN Subjects as sub ON 1=1--true
LEFT JOIN Examinations as ex
ON s.student_id= ex.student_id and ex.subject_name=sub.subject_name
GROUP BY s.student_id, sub.subject_name, s.student_name
ORDER BY s.student_id, sub.subject_name