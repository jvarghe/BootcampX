-- Get all cohorts with 18 or more students.
-- Select the cohort name and the total students.
-- Order by total students from smallest to greatest.

-- Expected Result:
--  cohort_name | student_count
-- -------------+---------------
--  FEB12       |            18
--  APR09       |            19
--  JUN04       |            19
--  NOV19       |            22
--  SEP24       |            22
-- (5 rows)


SELECT
  cohorts.name AS cohort_name,
  COUNT(*) AS student_count
FROM students
  JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING COUNT(*) >= 18
ORDER BY student_count;