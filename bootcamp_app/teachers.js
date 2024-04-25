const { Pool } = require("pg");


// CONNECTING TO THE DATABASE
const pool = new Pool({
  user: "development",
  password: "development",
  host: "localhost",
  database: "bootcampx2024",
});


// PROCESSING ARGUMENTS PASSED IN THROUGH THE CLI
const cohort = process.argv[2] || "JUL02";


// QUERIES
const query1 =

  `
  SELECT DISTINCT
    teachers.name AS teacher,
    cohorts.name AS cohort
  FROM teachers
    JOIN assistance_requests ON teachers.id = assistance_requests.teacher_id
    JOIN students ON students.id = assistance_requests.student_id
    JOIN cohorts ON cohorts.id = students.cohort_id
  WHERE cohorts.name LIKE '%${cohort}%'
  ORDER BY teachers.name;
  `;


// QUERY THE DATABASE
pool.query(query1)
  .then((result) => {

    // Print out records as JS objects in the terminal.
    // console.log(result.rows);


    // Query 1: Format and print out teacher and cohort information.
    result.rows.forEach(teacher => {
      console.log(`${teacher.cohort}: ${teacher.teacher}`);
    });

  })
  .catch((errorObj) => console.error("Query had an error:", errorObj.stack));