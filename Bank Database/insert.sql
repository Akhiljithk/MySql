USE Bank;

INSERT INTO branch (bname, city) values
('TVM', 'Trivandrum'),
('BNG', 'Bangalore'),
('NAG', 'Nagpur'),
('BOM', 'Bombay');

INSERT INTO customer (cname, city) values
('Arun', 'Bangalore'),
('Sunil', 'Trivandrum'),
('Sana', 'Trivandrum'),
('Shahin', 'Trivandrum'),
('Sweta', 'Nagpur'),
('Abhishek', 'Nagpur'),
('Dev', 'Bombay'),
('Neeraj', 'Bangalore');

INSERT INTO deposit (c_id, b_id, amount, dat) VALUES
(1, 1, 10000, '2018-01-01'),
(2, 2, 20000, '2018-07-05'),
(3, 3, 30000, '2020-01-01'),
(4, 4, 40000, '2020-11-10'),
(5, 1, 50000, '2021-01-01'),
(6, 3, 20000, '2021-03-03'),
(7, 1, 60000, '2021-05-01'),
(2, 3, 2000, '2018-08-01');

INSERT INTO borrow (c_id, b_id, amount, dat) VALUES
(1, 1, 5000, '2018-02-01'),
(2, 2, 10000, '2018-08-05'),
(3, 3, 15000, '2020-02-01'),
(4, 4, 20000, '2020-12-10'),
(5, 1, 25000, '2021-02-01'),
(7, 1, 60000, '2021-06-01');

INSERT INTO DEPARTMENT (dept_name) VALUES ('CE'), ('ME'), ('EE'), ('EC'), ('IT');
INSERT INTO DEPARTMENT (dept_name) VALUES ('CH'), ('FT'), ('ML'), ('AI'), ('CS');

INSERT INTO employee (ename, dob, doj, sal, dept_id) VALUES
('Nivin', '2001-01-01', '2019-08-01', 1000,  1), 
('Mahadev', '2001-01-02', '2020-08-01', 2000, 2),
('Lena', '2001-01-03', '2019-09-01', 3000, 3),
('Amal', '2002-01-01', '2019-10-01', 4000, 4), 
('Athira', '2002-02-01', '2019-08-01', 5000, 5), 
('Durga', '2002-03-01', '2019-08-02', 6000, 5), 
('Lakshmi', '2002-04-01', '2019-08-03', 7000, 5), 
('Ratan', '2002-05-01', '2019-08-04', 5000, 5), 
('Goutham', '2002-06-01', '2019-08-05', 6000, 5), 
('Nobin', '2001-02-01', '2020-08-01', 7000, 5),
('Mary', '2001-01-01', '2019-08-01', 2000,  10);