const { Pool } = require("pg");


// CONNECT TO THE DATABASE
const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx2024",
});


// QUERIES

// `pool.query` is a function that accepts an SQL query as a JavaScript string.
// Using the ` (backtick), we can write a multi line string like this to make
// our SQL look nicer. The function then returns a promise that contains our
// result when the query is successful.
pool.query(

  // Query the `students` & `cohorts` tables:
  `
  SELECT
        students.id,
        students.name,
        students.cohort_id,
        cohorts.name AS cohort_name
  FROM students
    JOIN cohorts ON cohorts.id = students.cohort_id
  LIMIT 50;
  `

// Records are being returned from the database, but with one important
// note: the data is returned as an array of JavaScript objects. The `pg`
// package and others handle the conversion of data from the database to
// JavaScript.
).then((result) => {

    // Print out records as JS objects in the terminal.
    // console.log(result.rows);


    // Format and print out student and cohort information.
    result.rows.forEach(student => {
      console.log(`${student.name} has an ID of ${student.id} and is in the ${student.cohort_name} cohort.`);
    });


  })
  .catch((errorObj) => console.error("Query had an error:", errorObj.stack));
