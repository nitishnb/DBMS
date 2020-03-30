
CREATE TABLE student1(
regno varchar2(20),
sname VARCHAR2(10),
major VARCHAR2(20),
bdate date,
 primary key(regno));

desc student;

CREATE TABLE course(
courseid number(20),cname VARCHAR2(20),
deptid varchar2(20),
PRIMARY KEY(courseid));

desc faculty;

CREATE TABLE text(
isbn number(20),
book_title varchar2(100),
publisher VARCHAR(20),
author varchar2(100),
PRIMARY KEY(isbn)
);

CREATE TABLE adoption(
courseid number(30),
isbn number(20),
sem number(30),
foreign key(courseid) references course(courseid),
foreign key(isbn) references text(isbn)
);

create table enroll(
regno varchar2(30),
courseid number(20),
sem number(10),
marks number(20),
foreign key(regno) references student1(regno),
foreign key(courseid) references course(courseid));

insert into student1 values('1DB01IS01','KIRAN','ISE','02-JAN-84');
insert into student1 values ('1DB01CS02','DIVYA','CSE','12-OCT-85');
insert into student1 values('1DBO1ME03','BABU','MECH','23-SEP-82');
insert into student1 values('1DB01EC04','JOHN','EC','21-FEB-84');
insert into student1 values('1DB01CS05','ASHA','CSE','07-OCT-7');

insert into course values(11,'DCS','CSE');
insert into course values('22','ADA','CSE');
insert into course values('33','CN','EC');
insert into course values('44','TD','MECH');
insert into course values('55','MUP','EC');

insert into text values('7722','VB','PHI','HOLZNER');
insert into text values('1144','DS WITH C','SAPNA','NANDAGOPAL');
insert into text values('4400','C PROG','PHI','BALAGURU');
insert into text values('5566','CN','PHI','TENENBAUM');
INSERT INTO text VALUES('3388','MP','TATA','BREY');

INSERT INTO ADOPTION VALUES(11,7722,3);
INSERT INTO ADOPTION VALUES(22,7722,4);
INSERT INTO ADOPTION VALUES(11,4400,5);
INSERT INTO ADOPTION VALUES(11,5566,8);
INSERT INTO ADOPTION VALUES(55,3388,4);
INSERT INTO ADOPTION VALUES(44,5566,4);
INSERT INTO ADOPTION VALUES(44,3388,7);


INSERT INTO ENROLL VALUES('1DB01IS01',22,5,76);
INSERT INTO ENROLL VALUES('1DB01IS01',11,3,90);
INSERT INTO ENROLL VALUES('1DB01CS02',33,6,55);
INSERT INTO ENROLL VALUES('1DB01CS05',44,5,75);

select * from course
select * from text;
select * from adoption;
select * from enroll;

select b.courseid,t.isbn,t.book_title from adoption b,text t,course c where c.courseid=b.courseid and c.deptid='CSE' and b.isbn=t.isbn and c.courseid in (select courseid from (select courseid from adoption group by courseid,isbn) group by courseid having count(*)>=2) order by t.book_title;
 select distinct c.deptid from course c where not exists ((select b.isbn from adoption b,course c1 where c1.courseid=b.courseid and c1.deptid=c.deptid) minus (select isbn from text where publisher='PHI')) and exists (select b.isbn from adoption b,course c1 where c1.courseid=b.courseid and c1.deptid=c.deptid);
