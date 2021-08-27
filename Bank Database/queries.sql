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

SELECT * FROM borrow;
SELECT * FROM branch;
SELECT * FROM customer;
SELECT * FROM deposit;

-- 2. Display the details of all customers having a loan amount greater than 50000.
SELECT cname,city from customer
JOIN borrow ON customer.c_id = borrow.c_id
WHERE amount > 50000;

-- 3. Display the names of all borrowers and their corresponding loan numbers.
SELECT c.cname, b.loan_no FROM customer AS c INNER JOIN borrow AS b
ON c.c_id=b.c_id;

-- 4 Display the customer name and branch name of customers who have made a deposit on or before 1/2/2021.
SELECT c.cname, br.bname FROM
customer AS c INNER JOIN  
deposit AS dep ON c.c_id=dep.c_id
INNER JOIN branch AS br ON dep.b_id=br.b_id WHERE dep.dat>'1/2/2021';

-- 5 Display the customer name, the date they have deposited and the amount. [Date format: Month day year]
  SELECT cname, dat, amount FROM customer 
  INNER JOIN deposit ON customer.c_id = deposit.c_id;
  
-- 6 Display the names of all customers who have made deposits between 31 Oct 2020 and 31 Mar 2021
SELECT cname FROM customer INNER JOIN deposit
ON customer.c_id = deposit.c_id WHERE deposit.dat BETWEEN '2020-10-31' AND '2021-03-31';

-- 7 Display the count of customers who have taken a loan and belonging to Nagpur.
SELECT count(cname) FROM customer 
INNER JOIN borrow ON customer.c_id = borrow.c_id
WHERE customer.city IN ('Nagpur');

-- 8 Display the average loan amount. Round the result to two decimal places.
SELECT round(avg(amount), 2) FROM borrow;

-- 9 Display the customers where name starts with 's' and the branch in which they have deposited. Branch name should also start with 's'.
USE bank;
SELECT cname,bname FROM customer 
JOIN deposit ON customer.c_id = deposit.c_id 
JOIN branch ON deposit.b_id = branch.b_id
WHERE customer.cname LIKE "S%" AND branch.bname LIKE "s%";

-- 10.	Display the customers having a loan amount between 5000 and 15000 in descending order of their loan amounts
SELECT cname FROM customer 
JOIN borrow ON  customer.c_id = borrow.c_id 
WHERE borrow.amount BETWEEN 5000 AND 15000 ORDER BY borrow.amount DESC;
  
-- 11. Display the customers having a loan amount between 5000 and 15000 in alphabetical order
SELECT cname FROM customer 
JOIN borrow ON  customer.c_id = borrow.c_id 
WHERE borrow.amount BETWEEN 5000 AND 15000 ORDER BY customer.cname;
  
-- 12. List the total loan which is given from each branch
SELECT branch.bname,sum(borrow.amount) AS "total" FROM branch 
JOIN borrow ON branch.b_id = borrow.b_id GROUP BY branch.bname;
  
-- 13. List the total deposit amount branch-wise  
SELECT branch.bname,sum(deposit.amount) AS "total" FROM branch 
JOIN deposit ON branch.b_id = deposit.b_id GROUP BY branch.bname;  

-- 14. List the total loan from any branch. (Let's say TVM)
SELECT bname,sum(amount) AS "Loan" FROM branch
JOIN borrow ON branch.b_id = borrow.b_id
WHERE branch.bname LIKE "TVM";

-- 15. List the total deposit of customers having an account which was started after 1 Jan 2015
SELECT customer.cname,sum(deposit.amount) AS "total_dep" FROM customer 
JOIN deposit WHERE deposit.dat > "2015-1-1" GROUP BY customer.c_id;

-- 16.	List total deposit of customers living in Bangalore.
SELECT customer.cname,sum(deposit.amount) AS "total_deposit" FROM customer
JOIN deposit ON customer.c_id = deposit.c_id 
WHERE customer.city LIKE "Bangalore"
GROUP BY customer.cname;

-- 17.	Find the biggest deposit amount of the customers living in Bombay.
SELECT customer.cname, MAX(deposit.amount) AS "biggest_deposit" FROM customer 
JOIN deposit ON customer.c_id = deposit.c_id
WHERE city LIKE "Bombay";

SELECT cname,city,amount FROM deposit
JOIN customer ON customer.c_id = deposit.c_id;

-- 18.	Find the total deposit of customers living in the same city that Sunil is also living.
SELECT sum(deposit.amount) AS "total_deposite" FROM customer 
JOIN deposit ON customer.c_id = deposit.c_id
WHERE city LIKE (SELECT city FROM customer WHERE cname LIKE "Sunil");

-- 19.	Count the total number of customers in each city.
SELECT city, count(cname) AS "Customers" FROM customer GROUP BY city;

-- 20.	List the name and deposit amount of all depositors and order them by the branch city.
SELECT cname, amount FROM customer 
JOIN deposit ON customer.c_id = deposit.c_id 
JOIN branch ON deposit.b_id = branch.b_id ORDER BY branch.city;

-- 21.	List the total deposit per branch by customers after 1 Jan 2015
SELECT bname, sum(amount) AS "tota_deposit" FROM branch 
JOIN deposit ON branch.b_id = deposit.b_id GROUP BY branch.bname;

-- 22.	Give the branch-wise loan of customers living in Nagpur.
SELECT cname,bname, borrow.amount FROM borrow 
JOIN customer ON borrow.c_id = customer.c_id
JOIN branch ON branch.b_id = borrow.b_id WHERE customer.city LIKE "Nagpur" ORDER BY branch.bname;

-- 23.	Count the number of customers in each branch.
SELECT bname, count(c_id) AS "no_of_customers"
FROM
( SELECT c_id, bname FROM deposit NATURAL JOIN branch	
  UNION 
  SELECT c_id, bname FROM borrow NATURAL JOIN branch	
) AS table2 GROUP BY bname;

-- 24.	Find the maximum loan of each branch.
SELECT bname, MAX(borrow.amount) FROM branch 
JOIN borrow ON branch.b_id = borrow.b_id GROUP BY branch.bname;

-- 25.	Find the number of customers who are depositors as well as borrowers.
SELECT COUNT(c_id) AS "count"
FROM customer WHERE c_id IN
(SELECT c_id FROM deposit)
JOIN 
(SELECT c_id FROM borrow);

