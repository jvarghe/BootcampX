/* PARAMETERIZED QUERIES
 *
 * This file has had its contents modified to implement parameterized queries.
 * If you want to compare with a file that uses unsanitized input, see
 * `teachers.js`.
 *
 * Always use parameterized queries when you have data that comes from an
 * untrusted source, which is pretty much every source.
 */

const { Pool } = require("pg");


// CONNECTING TO THE DATABASE
const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx2024",
});


// PROCESSING ARGUMENTS PASSED IN THROUGH THE CLI
const cohort = process.argv[2];
// The `|| 5` is a fallback value. If `process.argv[3]` is not provided (or is
// falsy, such as undefined), then the value `5` will be used as the default
// limit.
const limit = process.argv[3] || 5;

// Store the input values in an array so that database query can insert them
// into a query as parameters (parameterized queries).
const inputValues = [`%${cohort}%`, limit];


// QUERIES
// Define queries here:

// Query the `students` & `cohorts` tables without the user passing in any
// arguments.
const query1 =
  `
  SELECT
    students.id,
    students.name,
    students.cohort_id,
    cohorts.name AS cohort_name
  FROM students
    JOIN cohorts ON cohorts.id = students.cohort_id
  LIMIT 5;
  `
  ;


// Query the `students` & `cohorts` tables with user-specified values for
// cohort and the limit.
const query2 =
  `
  SELECT
    students.id,
    students.name,
    students.cohort_id,
    cohorts.name AS cohort_name
  FROM students
    JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2

  -- This is what unsanitized input looks like:
  -- WHERE cohorts.name LIKE '%${cohort}%'
  -- LIMIT ${limit};
  `
  ;


// QUERY THE DATABASE

// `pool.query` is a function that accepts an SQL query as a JavaScript string.
// Using the ` (backtick), we can write a multi line string like this to make
// our SQL look nicer. The function then returns a promise that contains our
// result when the query is successful.
pool.query(query2, inputValues)

  // Records are being returned from the database, but with one important
  // note: the data is returned as an array of JavaScript objects. The `pg`
  // package and others handle the conversion of data from the database to
  // JavaScript.
  .then((result) => {

    // Print out records as JS objects in the terminal.
    // console.log(result.rows);


    // Query 1 & 2: Format and print out student and cohort information.
    result.rows.forEach(student => {
      console.log(`${student.name} has an ID of ${student.id} and is in the ${student.cohort_name} cohort.`);
    });

    // Disconnect from the database.
    pool.end();
  })
  .catch((errorObj) => console.error("Query had an error:", errorObj.stack));
