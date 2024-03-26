-- Cohort Average Assistance Duration

-- We also need to know the average total amount of time being spent on an
-- assistance request for each cohort. This is just the average of the
-- total_duration column from the previous query.

-- Instruction
-- Calculate the average total duration of assistance requests for each cohort.
-- Use the previous query as a sub query to determine the duration per cohort.
-- Return a single row average_total_duration

-- Expected Result:
--  average_total_duration
-- ------------------------
--  555:22:25.909091
-- (1 row)


SELECT AVG(total_assistance_duration) AS average_total_duration
FROM (
    -- SUB-QUERY (Query From Previous Exercise)
    SELECT cohorts.name,
      SUM(
        assistance_requests.completed_at - assistance_requests.started_at
      ) AS total_assistance_duration
    FROM assistance_requests
      JOIN students ON students.id = assistance_requests.student_id
      JOIN cohorts ON cohorts.id = students.cohort_id
    GROUP BY cohorts.name
    ORDER BY total_assistance_duration     -- This variable has been renamed
                                           -- from the original query. Note
                                           -- that the AVG() function consumes
                                           -- it.
                                           -- Note the absence of an ending ';'
                                           -- in the sub-query.
) AS total_time;                           -- In PostgreSQL, a subquery in a
                                           -- `FROM` statement must have an
                                           -- alias defined using the `AS`
                                           -- keyword.


-- OFFICIAL ANSWER
--
-- SELECT avg (total_duration) as average_total_duration
-- FROM (
--   -- Query From Previous Exercise ()
--   SELECT cohorts.name as cohort, sum(completed_at-started_at) as total_duration
--   FROM assistance_requests
--   JOIN students ON students.id = student_id
--   JOIN cohorts on cohorts.id = cohort_id
--   GROUP BY cohorts.name
--   ORDER BY total_duration
-- ) as total_durations;