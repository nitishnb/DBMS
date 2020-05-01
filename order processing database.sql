CREATE TABLE CUSTOMER1 (
Custno number(10),
cname varchar2(30),
city varchar2(30),
primary key (Custno)
);


CREATE TABLE ORDER1 (
Orderno number(10),
Odate date,
Custno number(10),
Orderamount number(10,2),
primary key (Orderno),
foreign key(Custno) references CUSTOMER1(Custno)
);

CREATE TABLE ITEM1(
Itemno number(10),
Price number(10,2),
primary key (Itemno)
);

CREATE TABLE ORDERITEM (
Orderno number(10),
Itemno number(10),
Qty number(3),
foreign key(Orderno) references ORDER1(Orderno),
foreign key(Itemno) references ITEM1(Itemno)
);

CREATE TABLE WAREHOUSE(
Warehouseno NUMBER(10),
City VARCHAR2(20),
primary key (Warehouseno)
);

CREATE TABLE SHIPMENT( 
Orderno NUMBER(10),
Warehouseno NUMBER(10),
Shipment_Date DATE,
foreign key(Orderno) references ORDER1(Orderno),
foreign key(Warehouseno) references WAREHOUSE(Warehouseno)
);

INSERT INTO CUSTOMER1 VALUES('&Custno','&cname','&city');
INSERT INTO ORDER1 VALUES('&Orderno','&Odate','&Custno','&Orderamount');
INSERT INTO ITEM1 VALUES('&Itemno','&Price');
INSERT INTO ORDERITEM VALUES('&Orderno','&Itemno','&Qty11');
INSERT INTO WAREHOUSE VALUES('&Warehouseno','&City');
INSERT INTO SHIPMENT VALUES('&Orderno','&Warehouseno','&Shipment_Date');

SELECT * FROM CUSTOMER1;
SELECT * FROM ORDER1;
SELECT * FROM ITEM1;
SELECT * FROM ORDERITEM;
SELECT * FROM WAREHOUSE;
SELECT * FROM SHIPMENT;

select c.custno,count(*) as No_of_orders,avg(o.orderamount) as Avg_order_amount from customer1 c,order1 o where o.custno=c.custno group by c.custno;

select s.orderno from shipment s,warehouse w where s.warehouseno=w.warehouseno and w.city='Bangalore' group by orderno having count(*)=(select count(*) from warehouse where city='Bangalore') and not(count(*)=0);

delete from item1 where itemno=3;
