-- CREATE TABLE
CREATE TABLE student (
  student_id INT PRIMARY KEY,
  name VARCHAR(20),
  major VARCHAR(20)
);

-- alternative <PRIMARY KEY(student_id)>, AUTO_INCREMENT - auto numeration, NOT NULL - should be, UNIQUE - unique
CREATE TABLE student (
  student_id INT AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  major VARCHAR(20) UNIQUE,
  PRIMARY KEY(student_id)
);

-- Show the table
DESCRIBE srudent;
SELECT * FROM student;

-- Execute current statement
-- CTRL + ENTER

-- Delete table
DROP TABLE student;

-- Add and remove column
ALTER TABLE student ADD gpa DECIMAL(3,2);
ALTER TABLE student DROP COLUMN gpa;

-- Data types
-- INT - whole numbers
-- DECIMAL(M,N) - decimal number, M - total amount of digits, N - amount of digits after decimal points, (10,4) - 10 total digits and 4 of them coming after .
-- VARCHAR(1) - string of text of length 1
-- BLOB - images, files, Binary Large Object, stores large data
-- DATE - 'YYYY-MM-DD'
-- TIMESTAMP - 'YYY-MM-DD HH:MM:SS', used for recording

-- INSERT DATA
INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student(student_id, name VALUE(3, 'Kale');

-- UPDATE & DELETE
UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';

UPDATE student
SET major = 'Bio'
WHERE student_id = 4;

UPDATE student
SET major = 'Bio'
WHERE major = 'Biology' OR major = 'Chemistry';

-- whithout WHERE is will apply to every row
UPDATE srudent
SET name = 'Tom', major = 'undecided'
WHERE student_id = 1;

-- delete all
DELETE FROM student;

-- condition
DELETE FROM student
WHERE student_id = 5;

-- =    : equal
-- <>   : not equal
-- >    : greater than
-- <    : less than
-- >=   : greater than or equal
-- <=   : less than or equal

-- QUERIES
SELECT name, major
FROM student;

-- specifies from which table
SELECT student.name, student.major
FROM student
ORDER by name;

-- ORDER by name DESC; (descending)
-- ORDER by student.id DESC; (not displaying, order by student.id)
-- ORDER by student.id ASC; (ascending)
-- ORDER by major, student.id; (order by major, if repeated, order by student.id)

-- only displays 2 rows
SELECT student.name, student.major
FROM student
LIMIT 2;

SELECT * FROM srudent
WHERE major = 'Biology';

-- WHERE major = 'Biology' OR major = 'Chemistry';
-- WHERE major <> 'Chemistry';
-- WHERE student.id < 3;
-- WHERE name IN ('Kate', 'Nik');
-- WHERE major IN ('Biology' AND studemt.id > 2;

-- NESTED QUERIES - multiple selecte statament IN / =
SELECT employee.first_name
FROM employee
WHERE employee.emp.ID IN (
  SELECT works_with.emp_id
  FROM works_with
  WHERE works_with.total_sales > 30000
  LIMIT 1
  );
