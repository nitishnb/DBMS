create table student
(
  usn varchar(30),
  sname varchar(30),
  address varchar(30),
  phone int(30),
   gender varchar(30),
    primary key(usn)
    );
     create table SEMSEC(   
                     SSID VARCHAR(30), 
                    SEM INT(30), 
                  SEC INT(30),
                 PRIMARY KEY(sem) ) ;
CREATE TABLE CLASS
(
    USN VARCHAR(30),
    SSID varchar(30),
    FOREIGN KEY(USN) REFERENCES STUDENT(usn),
    foreign key(SSID) REFERENCES SEMSEC(SSID)
    );
  create table subject
 (
  subcode varchar(30),
    TITLE VARCHAR(30),
     SEM INT(30),
     CREDITS INT(30),
     primary key(SUBCODE),
     FOREIGN KEY(SEM) REFERENCES SEMSEC(SEM)); 
CREATE TABLE IAMARKS (
USN VARCHAR (10),
SUBCODE VARCHAR (8),
SSID VARCHAR (5),
TEST1 INT (2),
TEST2 INT (2),
TEST3 INT (2),
FINALIA INT (2),
PRIMARY KEY (USN, SUBCODE, SSID),
FOREIGN KEY (USN) REFERENCES STUDENT (USN),
FOREIGN KEY (SUBCODE) REFERENCES SUBJECT (SUBCODE),
FOREIGN KEY (SSID) REFERENCES SEMSEC (SSID));
insert into student values('&usn','&sname','&address',&phone,'&gender');
insert into class values('&usn','&ssid');
insert into subject values('&subcode','&title',&sem,&credits);
insert into iamarks values('&usn','&subcode','&ssid',&test1,&test2,&test3,&finalA);
INSERT INTO  SEMSEC VALUES('&SSID',&SEM,&SEC);
          1.SELECT S.*, SS.SEM, SS.SEC FROM STUDENT S, SEMSEC SS, CLASS C WHERE S.USN = C.USN AND SS.SSID = C.SSID AND SS.SEM = 4 AND SS.SEc='C'
           2.SELECT SS.SEM, SS.SEC, S.GENDER, COUNT(S.GENDER) AS COUNT FROM STUDENT S, SEMSEC SS, CLASS C WHERE S.USN = C.USN AND SS.SSID = C.SSID GROUP BY SS.SEM, SS.SEC, S.GENDER ORDER BY SEM 
          3.CREATE VIEW STU_TEST1_MARKS_VIEW AS SELECT TEST1, SUBCODE FROM IAMARKS WHERE USN = '1RN13CS091' 
          5.SELECT S.USN,S.SNAME,S.ADDRESS,S.PHONE,S.GENDER, (CASE WHEN IA.FINALIA BETWEEN 17 AND 20 THEN 'OUTSTANDING' WHEN IA.FINALIA BETWEEN 12 AND 16 THEN 'AVERAGE' ELSE 'WEAK' END) AS CAT FROM STUDENT S, SEMSEC SS, IAMARKS IA, SUBJECT SUB WHERE S.USN = IA.USN AND SS.SSID = IA.SSID AND SUB.SUBCODE = IA.SUBCODE AND SUB.SEM = 8
