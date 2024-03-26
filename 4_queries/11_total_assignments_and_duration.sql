-- Total Assignments and duration

-- We need to be able to see the number of assignments that each day has and the
-- total duration of assignments for each day.

-- Instruction
-- Get each day with the total number of assignments and the total duration of
-- the assignments.
-- Select the day, number of assignments, and the total duration of assignments.
-- Order the results by the day.

-- Expected Result:
--  day | number_of_assignments | duration
-- -----+-----------------------+----------
--    1 |                    11 |      590
--    2 |                     9 |      585
--    3 |                     9 |      425
--    4 |                     9 |      380
--    5 |                     7 |      405
-- ...
-- (51 rows)


SELECT
  assignments.day,
  -- Counts the number of assignments per day.
  COUNT(assignments.*) AS number_of_assignments,
  -- Counts the total duration of assignments per day.
  SUM(assignments.duration) AS total_assignment_duration
FROM assignments
GROUP BY assignments.day
ORDER BY assignments.day;