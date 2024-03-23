-- Get the total number of assignment submissions for each cohort.
-- Select the cohort name and total submissions.
-- Order the results from greatest to least submissions.

-- Expected Result:
--  cohort | total_submissions
-- --------+-------------------
--  SEP24  |              9328
--  JUN04  |              8030
--  APR09  |              7935
--  NOV19  |              7231
--  JUL02  |              5868
-- ...
-- (11 rows)


-- The results are different from expected result, but this is true of the
-- official solution as well. Both give the same results, so I suspect the
-- data set has been changed.
SELECT
  cohorts.name AS cohort,
  COUNT(assignment_submissions.*) AS total_assignment_submissions
FROM assignment_submissions
  JOIN students ON students.id = assignment_submissions.student_id
  JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY total_assignment_submissions DESC;