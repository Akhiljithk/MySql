USE bank;
-- 1. Write a function to find the number of customers who have loan.
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$
CREATE FUNCTION loan_count()
RETURNS INT
BEGIN
	DECLARE count INT;
	SELECT count(DISTINCT customer.c_id) AS "count" FROM customer
	JOIN borrow ON customer.c_id = borrow.c_id
    INTO count;
	RETURN count;
END$$
DELIMITER ;
SELECT loan_count ();

-- 2. Write a procedure to list details of all customers.
DELIMITER $$
CREATE PROCEDURE listDetails()
BEGIN
	SELECT * FROM customer;
END$$
DELIMITER ;
CALL listDetails();

-- 3. Write a procedure for updating the salary of employees working in the department with dept_id=10 by 20%
SET SQL_SAFE_UPDATES = 0;
DELIMITER $$
CREATE PROCEDURE updateSalary(id INTEGER, rate NUMERIC)
BEGIN
	UPDATE employee SET sal = sal*(1+rate/100)
	WHERE dept_id=id; 
END$$
DELIMITER ;
CALL updateSalary(10, 20);
SET SQL_SAFE_UPDATES = -1;

-- 4. Write a function for employee table which accepts dept_id and return the highest salary in that department. Handle the error if the dept_id does not exist or if the query return more than one maximum
DELIMITER $$
CREATE FUNCTION highestSalery(id INTEGER)
RETURNS DECIMAL
BEGIN
	DECLARE max_salary NUMERIC;
	DECLARE cnt INTEGER;
	DECLARE dept_exists INTEGER; 
    -- if id dont exist return -1
    SELECT COUNT(dept_id) FROM department WHERE dept_id=id INTO dept_exists;
	IF dept_exists=0 THEN
		RETURN -1;
    END IF;
    -- if more than one employee with same max(sal) then return -2
    SELECT COUNT(*) FROM employee WHERE dept_id=id AND sal IN
	(SELECT MAX(sal) FROM employee WHERE dept_id=id) INTO cnt;
	IF cnt>1 THEN
		RETURN -2;
	END IF;
    -- above 2 conditions are false then this statement for select max(sal) will work
	SELECT MAX(sal) FROM employee 
	WHERE dept_id = id 
    INTO max_salary;
    RETURN max_salary;
    
END$$
DELIMITER ;
SELECT highestSalery(5);

-- DROP FUNCTION highestSalery;
SELECT * FROM employee;

-- 5. Write a function which accepts emp_id and returns employee experience
DELIMITER $$
CREATE FUNCTION getExperiance(id INTEGER)
RETURNS DECIMAL
BEGIN 
	DECLARE experiance DECIMAL;
    DECLARE join_dat DATE;
    SELECT doj FROM employee WHERE emp_id = id 
    INTO join_dat;
    SELECT DATEDIFF(CURRENT_DATE(), join_dat) INTO experiance;
    RETURN experiance;
END$$
DELIMITER ;

DROP FUNCTION getExperiance;
SELECT getExperiance(1);
SELECT DATEDIFF("2017-06-15", "2017-06-25") AS row1;
SELECT CURRENT_DATE();
