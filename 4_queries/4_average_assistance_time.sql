-- We need to be able to see the current average time it takes to complete an
-- assistance request.

-- Instruction
-- Get the average time of an assistance request.
-- Select just a single row here and name it average_assistance_request_duration.
-- In Postgres, we can subtract two timestamps to find the duration between
-- them. (timestamp1 - timestamp2)

-- Expected Result:
--  average_assistance_request_duration
-- -------------------------------------
--  00:14:21.556903
-- (1 row)


SELECT AVG(
    assistance_requests.started_at - assistance_requests.completed_at
  ) AS average_assistance_request_duration
FROM assistance_requests;