CREATE TABLE BRANCH(
branch_name  varchar2(30),
branch_city varchar2(30),
assets number(8,2),
primary key (branch_name)
);

CREATE TABLE ACCOUNTS (
accno number(11),
branch_name varchar2(30),
balance number(8,2),
primary key (accno), foreign key (branch_name) REFERENCES BRANCH(branch_name)
);


CREATE TABLE CUSTOMER (
customer_name varchar2(30),
customer_street varchar2(30),
customer_city varchar2(30),
primary key (customer_name)
);

CREATE TABLE DEPOSITOR(
customer_name varchar2(30),
accno number(11),
foreign key (accno) REFERENCES ACCOUNTS(accno),
foreign key (customer_name) REFERENCES CUSTOMER(customer_name)   
);

CREATE TABLE LOAN (
loan_number number(11), 
branch_name varchar2(30), 
amount number(8,2),
primary key (loan_number),
foreign key (branch_name) REFERENCES BRANCH(branch_name)
);

CREATE TABLE BORROWER (
customer_name varchar2(30),
loan_number number(11),
foreign key (loan_number) REFERENCES LOAN(loan_number),
foreign key (customer_name) REFERENCES CUSTOMER(customer_name)   
);

INSERT INTO BRANCH VALUES('&branch_name','&branch_city',&assets);

INSERT INTO ACCOUNTS VALUES(&accno,'&branch_name',&balance);

INSERT INTO CUSTOMER VALUES('&customer_name','&customer_street','&customer_city');

INSERT INTO DEPOSITOR VALUES('&customer_name',&accno);

INSERT INTO LOAN VALUES('&loan_number','&branch_name',&amount);

INSERT INTO BORROWER VALUES('&customer_name','&loan_number');

SELECT * FROM ACCOUNTS;
SELECT * FROM CUSTOMER;
SELECT * FROM DEPOSITOR;
SELECT * FROM LOAN;
SELECT * FROM BORROWER;



