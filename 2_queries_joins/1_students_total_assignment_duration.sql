-- Get the total amount of time that a student has spent on all assignments.
-- This should work for any student but use 'Ibrahim Schimmel' for now.
-- Select only the total amount of time as a single column.


-- This just returns the column name and a mention that there's 1 row, but
-- no records. This isn't working right. The duration should be shown in
-- minutes but it isn't.
SELECT SUM(assignment_submissions.duration) AS Assignment_Duration
FROM assignment_submissions
JOIN students
ON students.id = assignment_submissions.student_id
WHERE students.name = 'Ibrahim Schimmel';


-- OFFICAL ANSWER
-- The query returns the same as my answer.

-- SELECT sum(assignment_submissions.duration) as total_duration
-- FROM assignment_submissions
-- JOIN students ON students.id = student_id
-- WHERE students.name = 'Ibrahim Schimmel';