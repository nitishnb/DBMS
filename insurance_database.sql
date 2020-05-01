CREATE TABLE PERSON(DRIVER_ID VARCHAR2(10), NAME VARCHAR2(20), ADDRESS VARCHAR2(15), PRIMARY KEY(DRIVER_ID));

CREATE TABLE CAR(REGNO VARCHAR2(10), MODEL VARCHAR2(10), YEAR NUMBER(4), PRIMARY KEY(REGNO));

CREATE TABLE ACCIDENT(REPORT_NO NUMBER(5), ADATE DATE, LOCATION VARCHAR2(15), PRIMARY KEY(REPORT_NO));

CREATE TABLE OWNS(DRIVER_ID VARCHAR2(10), REGNO VARCHAR2(10), PRIMARY KEY(DRIVER_ID,REGNO), FOREIGN KEY(DRIVER_ID) REFERENCES PERSON(DRIVER_ID), FOREIGN KEY(REGNO) REFERENCES CAR(REGNO));

CREATE TABLE PARTICIPATED( DRIVER_ID VARCHAR2(10), REGNO VARCHAR2(10), REPORT_NO NUMBER(5), DAMAGE_AMT NUMBER(7,2), PRIMARY KEY(DRIVER_ID,REGNO,REPORT_NO), FOREIGN KEY(DRIVER_ID,REGNO) REFERENCES OWNS(DRIVER_ID,REGNO) ON DELETE CASCADE,
FOREIGN KEY(REPORT_NO) REFERENCES ACCIDENT(REPORT_NO) ON
DELETE CASCADE);

INSERT INTO PERSON VALUES('&DRIVER_ID','&NAME','&ADDRESS');

INSERT INTO CAR VALUES('&REGNO','&MODEL',&YEAR);

INSERT INTO OWNS VALUES('&DRIVER_ID','&REGNO');

INSERT INTO PARTICIPATED VALUES('&DRIVER_ID','&REGNO','&REPORT_NO',&DAMAGE_AMT);

SELECT * FROM PARTICIPATED;

UPDATE PARTICIPATED SET DAMAGE_AMT=25000 WHERE REPORT_NO =22 AND REGNO='51';

SELECT COUNT(*) FROM ACCIDENT WHERE ADATE LIKE '22-05-2018';

SELECT COUNT(A.REPORT_NO) FROM ACCIDENT A, PARTICIPATED P, CAR C WHERE A.REPORT_NO=P.REPORT_NO AND P.REGNO=C.REGNO AND C.MODEL='CITY';