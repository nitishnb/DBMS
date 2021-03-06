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
primary key (accno), 
foreign key (branch_name) REFERENCES BRANCH(branch_name)
);

CREATE TABLE CUSTOMER (
customer_name varchar2(30),
customer_street varchar2(30),
customer_city varchar2(30),
primary key (customer_name)
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

INSERT INTO BRANCH VALUES('PD NAGAR','BANGALORE',20000);
INSERT INTO BRANCH VALUES('RAJAJI NAGAR','BANGALORE',50000);
INSERT INTO BRANCH VALUES('JAYANAGAR','BANGALORE',660000);
INSERT INTO BRANCH VALUES('VIJAYANAGAR','BANGALORE',870000);
INSERT INTO BRANCH VALUES('HOSAKEREHALLI', 'BANGALORE', 550000);

INSERT INTO ACCOUNTS VALUES(1234602 , 'HOSAKEREHALLI', '5000');
INSERT INTO ACCOUNTS VALUES(1234603 ,'VIJAYANAGAR', '5000');
INSERT INTO ACCOUNTS VALUES(1234604 ,'JAYANAGAR', '5000');
INSERT INTO ACCOUNTS VALUES(1234605 ,'RAJAJI NAGAR', '10000');
INSERT INTO ACCOUNTS VALUES(1234503 ,'VIJAYANAGAR', '40000');
INSERT INTO ACCOUNTS VALUES(1234504 ,'PD NAGAR', '4000');

INSERT INTO CUSTOMER VALUES('KEZAR', 'M G ROAD', 'BANGALORE');
INSERT INTO CUSTOMER VALUES('LAL KRISHNA', 'ST MKS ROAD', 'BANGALORE');
INSERT INTO CUSTOMER VALUES('RAHUL', 'AUGSTEN ROAD', 'BANGALORE');
INSERT INTO CUSTOMER VALUES('LALLU', 'V S ROAD', 'BANGALORE');
INSERT INTO CUSTOMER VALUES('FAIZAL', 'RESEDENCY ROAD', 'BANGALORE');
INSERT INTO CUSTOMER VALUES('RAJEEV', 'DICKNSN ROAD', 'BANGALORE');


INSERT INTO LOAN VALUES('10011', 'JAYANAGAR', 10000);
INSERT INTO LOAN VALUES('10012', 'VIJAYANAGAR', 5000);
INSERT INTO LOAN VALUES('10013', 'HOSAKEREHALLI', 20000);
INSERT INTO LOAN VALUES('10014', 'PD NAGAR', 15000);
INSERT INTO LOAN VALUES('10015', 'RAJAJI NAGAR', 25000);

INSERT INTO BORROWER VALUES('KEZAR', 10011);
INSERT INTO BORROWER VALUES('LAL KRISHNA', 10012);
INSERT INTO BORROWER VALUES('RAHUL', 10013);
INSERT INTO BORROWER VALUES('LALLU', 10014);
INSERT INTO BORROWER VALUES('LAL KRISHNA', 10015);



SELECT * FROM BRANCH;
SELECT * FROM ACCOUNTS;
SELECT * FROM CUSTOMER;
SELECT * FROM LOAN;
SELECT * FROM BORROWER;

select d.customer_name from depositor d,accounts a where a.accno=d.accno and a.branch_name='KRMarket' group by d.customer_name having count(*)>=2;



select c.customer_name from customer c where exists(select branch_name from branch where branch_city='Bangalore') and not exists ((select branch_name from branch where branch_city='Bangalore') minus (select b.branch_name from branch b,accounts a,depositor d where d.customer_name=c.customer_name and d.accno=a.accno and a.branch_name=b.branch_name));



delete from accounts where accno in (select a.accno from accounts a,branch b where a.branch_name=b.branch_name and b.branch_city='Bangalore');
