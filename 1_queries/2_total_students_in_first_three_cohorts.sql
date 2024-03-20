SELECT COUNT(*) FROM students
WHERE cohort_id BETWEEN 1 AND 3;

-- Alternate:
-- SELECT count(id)
-- FROM students
-- WHERE cohort_id IN (1,2,3);