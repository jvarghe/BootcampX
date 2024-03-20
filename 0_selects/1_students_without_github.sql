SELECT id, name, email, cohort_id
FROM students
-- "github = NULL" and "github = ''" will not work.
WHERE github IS NULL
ORDER BY cohort_id;