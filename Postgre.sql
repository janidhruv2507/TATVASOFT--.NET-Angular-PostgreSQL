CREATE TABLE student (
  Firstname VARCHAR(255),
  Lastname VARCHAR(255),
  Enroll INT,
  Branch VARCHAR(50)
);
INSERT INTO student(Firstname, Lastname, Enroll, Branch)
VALUES
('Dhruv', 'Jani', 14, 'IOT'),
('Het', 'Patel', 24, 'IOT'),
('Samarth', 'Bhimani', 52, 'IOT'),
('Pankeet', 'Manuberwala', 42, 'CSD'),
('Nandan', 'Patel', 21, 'CP'),
('Nitya', 'Chauhan', 22, 'CP'),
('Krisha', 'Mangukiya', 35, 'CSD'),
('Abhay', 'Kunpara', 37, 'CSD'),
('Parth', 'Mahajan', 45, 'IOT'),
('Krina', 'Sanghani', 31, 'IOT')


SELECT Firstname,Enroll FROM student;

SELECT * FROM student;



UPDATE student
SET Department = CASE
    WHEN Branch IN ('IOT', 'IT') THEN 'Information Technology'
    WHEN Branch IN ('CP', 'CSD') THEN 'Computer Engineering'
    ELSE Department
END;



DELETE FROM student WHERE enroll='16';
ALTER TABLE student RENAME COLUMN Branch TO Stream;

SELECT * FROM student WHERE Enroll=4;
SELECT * FROM student WHERE Enroll<30;
SELECT * FROM student WHERE Enroll<=30;
SELECT * FROM student WHERE Enroll>30;
SELECT * FROM student WHERE Enroll>=30;
SELECT * FROM student WHERE Enroll!=4;
SELECT * FROM student WHERE Firstname LIKE 'A%';
SELECT * FROM student WHERE Firstname LIKE 'Anu%';
SELECT * FROM student WHERE Firstname ILIKE 'ANU%';
SELECT * FROM student ORDER BY Enroll DESC;
SELECT * FROM student LIMIT 10;
SELECT * FROM student OFFSET 5 LIMIT 10; 


SELECT COUNT(*) FROM student;
SELECT AVG(Enroll) FROM student;
SELECT MAX(Enroll), MIN(Enroll) FROM student;
SELECT Stream, COUNT(*) FROM student GROUP BY Stream;
SELECT Stream, COUNT(*) FROM student GROUP BY Stream HAVING COUNT(*) > 2;
SELECT Stream, COUNT(*) FROM student GROUP BY Stream HAVING COUNT(*) < 3;

CREATE TABLE temporarytable(enrollment INT);
SELECT * FROM temporarytable;
DROP TABLE temporarytable;

DELETE FROM student
WHERE Firstname IS NULL
  AND Lastname IS NULL
  AND Enroll IS NULL
  AND Stream IS NULL;


ALTER TABLE student ADD COLUMN student_id SERIAL PRIMARY KEY;
ALTER TABLE student ALTER COLUMN Enroll SET NOT NULL;
ALTER TABLE student ADD Department VARCHAR(255);
ALTER TABLE student
ADD temporarycolumn INT;
DROP COLUMN temporarycolumn;


CREATE TABLE department (
  dept_id SERIAL PRIMARY KEY,
  dept_name VARCHAR(255) UNIQUE NOT NULL
);
INSERT INTO department (dept_name)
VALUES
('Information Technology'),
('Computer Engineering');

ALTER TABLE student ADD COLUMN dept_id INT;

UPDATE student
SET dept_id = CASE
    WHEN Department = 'Information Technology' THEN 1
    WHEN Department = 'Computer Engineering' THEN 2
END;

ALTER TABLE student
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id) REFERENCES department(dept_id);

INSERT INTO department (dept_name)
VALUES ('Data Science'); 

INSERT INTO student (Firstname, Lastname, Enroll, Stream, Department, dept_id)
VALUES ('Anu', 'Rana', 15, 'None', NULL, NULL);

-- inner join
SELECT s.firstname, s.enroll, d.dept_name
FROM student s
INNER JOIN department d ON s.dept_id = d.dept_id;

--left
SELECT s.firstname, s.enroll, d.dept_name
FROM student s
LEFT JOIN department d ON s.dept_id = d.dept_id;

--right join
SELECT s.firstname, s.enroll, d.dept_name
FROM student s
RIGHT JOIN department d ON s.dept_id = d.dept_id;


SELECT s.firstname, s.enroll, d.dept_name
FROM student s
FULL JOIN department d ON s.dept_id = d.dept_id;


