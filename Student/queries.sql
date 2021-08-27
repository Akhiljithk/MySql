-- 2.	List all classes where strength is greater than 50
SELECT class_name FROM class WHERE st_cnt > 50;

-- 3.	List the name of students of Lina teacher.
SELECT st_fname, st_lname FROM student 
JOIN student_class ON student.st_id = student_class.st_id
JOIN teacher ON student_class.teacher_id = teacher.teacher_id 
WHERE teacher.fname LIKE "Lina";

-- 4.	List the names of all the English teachers.
SELECT fname FROM teacher WHERE subject LIKE "English";

-- 5.	List the names of teachers who teach standard 9.
SELECT DISTINCT fname, lname FROM teacher 
JOIN student_class ON teacher.teacher_id = student_class.teacher_id
JOIN class ON student_class.class_id = class.class_id 
WHERE class.class_name LIKE "9";

-- 6. Find out all the classes that are taught by Jaya teacher
SELECT DISTINCT class_name, division FROM class 
JOIN student_class ON class.class_id = student_class.class_id
JOIN teacher ON student_class.teacher_id = teacher.teacher_id 
WHERE teacher.fname LIKE "Jaya";

-- 7.	List the names and details of all students in standard 10
SELECT DISTINCT st_fname, st_lname FROM student 
JOIN student_class ON student.st_id = student_class.st_id
JOIN class ON student_class.class_id = class.class_id 
WHERE class.class_name LIKE "10";

-- 8.	List all the students whose first name is the same along with their student id.
SELECT t1.st_fname, t1.st_id FROM student AS t1
INNER JOIN student AS t2
WHERE t1.st_fname = t2.st_fname AND t1.st_id <> t2.st_id;
 
-- 9.	List the name of students whose name starts with 's'.
SELECT st_fname, st_lname FROM student WHERE st_fname LIKE "s%";

-- 10.	Create a view named student_names and display the student’s first name and last name.
  CREATE VIEW student_names (
    FirstName,
    LastName
  )
  AS SELECT st_fname, st_lname FROM student;
  SELECT * FROM student_names;

-- 11.	Create a view named teacher_names and display the teacher’s first name and last name.
  CREATE VIEW teacher_names(
    FirstName,
    LastName
  )
  AS SELECT fname, lname FROM teacher;
  SELECT * FROM teacher_names;
  
  -- 12. Create a view named student_teachers and display the student’s first name, last name, teacher’s first name, last name and subject (that is student’s name, subjects the student is studying and the name of teacher taking that subject).
  CREATE VIEW student_teachers (student, teacher, subject) AS 
  SELECT concat(student.st_fname," ",student.st_lname) AS student, concat(teacher.fname," ",teacher.lname) AS teacher, subject 
  FROM student JOIN student_class ON student.st_id = student_class.st_id 
  JOIN teacher ON teacher.teacher_id = student_class.teacher_id;
SELECT * FROM student_teachers;

