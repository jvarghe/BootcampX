-- We need to be able to see the total amount of time being spent on an
-- assistance request for each cohort. This number will tell use how much time
-- is being spent on assistance requests for each cohort.

-- Instruction
-- Get the total duration of all assistance requests for each cohort.
-- Select the cohort's name and the total duration the assistance requests.
-- Order by total_duration.
-- Look at the ERD to see how to join the tables.

-- Expected Result:
--  cohort | total_duration
-- --------+----------------
--  JUL30  | 390:35:20
--  AUG27  | 398:19:00
--  JUL02  | 453:50:30
--  NOV19  | 462:34:40
--  MAY07  | 480:10:55
--  ...
--  (11 rows)


SELECT cohorts.name,
  SUM(
    assistance_requests.completed_at - assistance_requests.started_at
  ) AS total_assistance_duration
FROM assistance_requests
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY total_duration;