CREATE DATABASE student;
USE student;
CREATE TABLE class(
	class_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	class_name VARCHAR(20) NOT NULL,
	division VARCHAR(5),
	st_cnt INTEGER
);
CREATE TABLE student(
	st_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	st_fname VARCHAR(40) NOT NULL,
	st_lname VARCHAR(40),
	address VARCHAR(40),
	phone VARCHAR(15),
	email VARCHAR(30)
);
CREATE TABLE teacher(
	teacher_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	fname VARCHAR(40) NOT NULL,
	lname VARCHAR(40),
	phone VARCHAR(15),
	subject VARCHAR(30)
);
CREATE TABLE student_class(
	st_id INTEGER REFERENCES student(st_id),
	class_id INTEGER REFERENCES class_(class_id),
	teacher_id INTEGER REFERENCES teacher(teacher_id),
  PRIMARY KEY(st_id, class_id, teacher_id)
);
SELECT * FROM class;
SELECT * FROM student;
SELECT * FROM teacher;
SELECT * FROM student_class;


INSERT INTO class (class_name, division, st_cnt) VALUES
('10', 'A', 1),
('10', 'B', 3),
('9', 'A', 2);

INSERT INTO student (st_fname, st_lname, address, phone, email) VALUES
('Arun', 'Sathosh', 'Arun villa', '9000000000', 'arunvs@gmail.com'),
('Abhishek', 'V M', NULL, '8000000000', 'email01@email.com'),
('Adithya', 'Vikram R Nair', NULL, '7000000000', 'email02@email.com'),
('Adnan', 'Shajahan', NULL, '6000000000', 'email03@email.com'),
('Advaitha', 'Jayakumar', NULL, '5000000000', 'email04@email.com'),
('Adwaid', 'M', NULL, '4000000000', 'email05@email.com'),
('Godwin', 'Kuriakose', NULL, NULL, NULL),
('Godwin', 'Resnick C', NULL, NULL, NULL),
('Aiswarya', 'Lakshmi P S', NULL, NULL, NULL),
('Aiswarya', 'Rajendran', NULL, NULL, NULL),
('Anu', 'A J', NULL, NULL, NULL),
('Anu', 'K M', NULL, NULL, NULL);

-- Insert data into teacher table
INSERT INTO teacher (fname, lname, phone, subject)
VALUES
('Amarnath', 'S P', '1111111111', 'English'),
('Akash', 'S', '2222222222', 'Chemistry'),
('Lina', 'P', '3333333333', 'Maths'),
('Jaya', 'A S', '4444444444', 'Physics');

-- Insert data into student_class table
INSERT INTO student_class VALUES
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(2, 2, 1),
(2, 2, 2),
(2, 2, 3),
(3, 2, 1),
(3, 2, 2),
(3, 2, 3),
(4, 2, 1),
(4, 2, 2),
(4, 2, 3),
(5, 3, 2),
(5, 3, 4),
(6, 3, 2),
(7, 3, 4);




