-- Get the cohort with the longest average duration of assistance requests.
-- The same requirements as the previous query, but only return the single row
-- with the longest average.

-- Expected Result:
--  name  | average_assistance_time
-- -------+-------------------------
--  MAR12 | 00:15:44.556041
-- (1 row)


SELECT cohorts.name AS cohort_name,
  AVG(
    assistance_requests.started_at - assistance_requests.completed_at
  ) AS average_assistance_time
FROM assistance_requests
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time
LIMIT 1;