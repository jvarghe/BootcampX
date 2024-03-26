-- We need to be able to see how many assistance requests any student has
-- requested.

-- Instruction
-- Get the total number of assistance_requests for a student.

-- Select the student's name and the total assistance requests.
-- Since this query needs to work with any specific student name, use
-- 'Elliot Dickinson' for the student's name here.
-- Expected Result:

--  total_assistances |       name
-- -------------------+------------------
--                138 | Elliot Dickinson
-- (1 row)


SELECT
  COUNT(assistance_requests.*) AS total_assistances,
  students.name
FROM assistance_requests
JOIN students ON students.id = assistance_requests.student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;