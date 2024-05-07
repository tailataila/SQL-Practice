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
DESCRIBE student;
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

SELECT first name AS forename, last_name AS surname
FROM employee;

--find out all the different gender
SELECT DISTINCT sex
FROM employee;

-- NESTED QUERIES - multiple selecte statament IN / =
SELECT employee.first_name
FROM employee
WHERE employee.emp.ID IN (
  SELECT works_with.emp_id
  FROM works_with
  WHERE works_with.total_sales > 30000
  LIMIT 1
  );

-- ON DELETE
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id)
  ON DELETE SET NULL
  );

-- return to table employee, enter foreign key

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id)
  ON DELETE SET CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id)
  ON DELETE SET CASCADE
  );

-- ON DELETE SET NULL - delete emp_id = 102 and replace with NULL
DELETE FROM employee
WHERE emp_id = 102;

-- ON DELETE SET CASCADE
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id)
  ON DELETE SET CASCADE
  );

DELETE FROM branch
WHERE branch_id = 2;

-- PRIMARY KEY can't be set to NULL, it should have value
-- only foreigh key can be set to NULL
-- if primary key deleted, that deletes the entire table

-- FUNCTIONS - block of code tha we can call, which will do something for us
SELECT COUNT(emp_id)
FROM employee
-- count how many employees

SELECT COUNT(DISTINCT super_id)
FROM employee;
-- count unique super_id

SELECT AVG(salary)
FROM employee;
-- average

SELECT SUM(salary)
FROM employee;
- sum

-- AGGRIGATION
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;
-- sex in the first row - show the column, will show how many M and F

SELECT SUM(total_sales), emp_id
  FROM works_with
  GROUP BY emp_id;
-- shows how much each employee sold

-- TRIGGERS
-- block of SQL code which defines a certain action that should happen when a certain operation gets performed
-- delimeter in Mysql is ";", so the code stops executing after that and we need ti change delimeter to "S" and at the end of trigger change the delimeter back

DELIMETER $$
CREATE
   TRIGGER my_trigger BEFORE INSERT
   ON employee
   FOR EACH ROW BEGIN
   INSERT INTO trigger_test VALUES('added new employee');
END $$
DELIMETER ;

-- INSERT INTO trigger_test VALUES(NEW.first_name);
-- BEFORE -> AFTER
-- INSERT -> DELETE

DELIMETER $$
CREATE
   TRIGGER my_trigger1 BEFORE INSERT
   ON employee
    IF NEW.sex = 'M' THEN
     INSERT INTO trigger_test VALUES('added male');
    ELSE IF NEW.sex = 'F' THEN
     INSERT INTO trigger_test VALUES('added female');
    ELSE
     INSERT INTO trigger_test VALUES('added other');
    END IF;
END $$
DELIMETER ;


