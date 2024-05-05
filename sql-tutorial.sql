-- CREATE TABLE
CREATE TABLE student (
  student_id INT PRIMARY KEY,
  name VARCHAR(20),
  majosr VARCHAR(20)
);
-- alternative <PRIMARY KEY (student_id)>

-- Show the table
DESCRIBE srudent;
SELECT * FROM student;

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
