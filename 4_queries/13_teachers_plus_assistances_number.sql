-- Name of Teachers and Number of Assistances

-- We need to know which teachers actually assisted students during any
-- cohort, and how many assistances they did for that cohort.

-- Instruction
-- Perform the same query as before, but include the number of assistances as
-- well.

-- Expected Result:
--       teacher       | cohort | total_assistances
-- --------------------+--------+-------------------
--  Cheyanne Powlowski | JUL02  |               336
--  Georgiana Fahey    | JUL02  |               158
--  Helmer Rodriguez   | JUL02  |               157
--  Jadyn Bosco        | JUL02  |               177
-- ...
-- (8 rows)


SELECT
  teachers.name AS teacher,
  cohorts.name AS cohort,
  COUNT(assistance_requests.*) AS total_assistance_requests
FROM teachers
  JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = 'JUL02'
-- Group the results by both teacher and cohort names.
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;