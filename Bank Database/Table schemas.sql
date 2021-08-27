USE Bank;
CREATE TABLE branch(
	b_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	bname VARCHAR(30) NOT NULL,
	city VARCHAR(30)
);
CREATE TABLE customer(
	c_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(30) NOT NULL,
	city VARCHAR(30)
);
CREATE TABLE deposit(
	acc_no INTEGER PRIMARY KEY AUTO_INCREMENT,
	c_id INTEGER  REFERENCES customer(c_id),
	b_id INTEGER  REFERENCES branch(b_id),
	amount NUMERIC,
	dat DATE
);
CREATE TABLE borrow(
	loan_no INTEGER PRIMARY KEY AUTO_INCREMENT,
	c_id INTEGER REFERENCES customer(c_id),
	b_id INTEGER REFERENCES branch(b_id),
	amount NUMERIC,
	dat DATE
);
CREATE TABLE department (
	dept_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	dept_name VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE employee (
	emp_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	ename VARCHAR(30) NOT NULL,
	dob DATE,
	doj DATE,
	sal DECIMAL,
	dept_id INTEGER REFERENCES department(dept_id)
);
