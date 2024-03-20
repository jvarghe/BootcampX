-- A student's end date will be NULL when they are currently enrolled in
-- Bootcamp. Use this to get all of the students currently enrolled.

SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;