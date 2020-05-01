CREATE table flights
(
    flno int(30),
    fromfl varchar(30),
    tofl varchar(30),
    distance int(30),
    departs timestamp,
    arrives timestamp,
    price int(30),
    primary key(flno));
CREATE table aircraft 
( 
     aid int(30), 
     aname varchar(30),  
     cruisingrange int(30), 
      primary key(aid));
create table employess(
eid int(30),
ename varchar(20),
salary int(30),
primary key(eid));
    
create table certified(
eid int(30),
aid int(30),
foreign key(eid) references employess(eid),
foreign key(aid) references aircrafts(aid));
insert into flights values(102,'bengaluru','lucknow',3000,'07:15:31','11:15:31',6000) 
insert into flights values('&flno','&ffrom','&tto','&distance','&depart','&arrives','&price');
commit;
insert into aircraft values(&aid,'&aname',&cruisingrange);
insert into employess values(&eid,'&ename',&salary);
insert into certified values(&eid,&aid);
sql queries
1.select distinct aname from aircrafts where aid in(select c.aid from certified c, employess e where c.eid=e.eid and not exists( select * from employess e1 where e1.eid=e.eid and e1.salary<80000));
2.select c.eid ,max(a.cruisingrange) from certified c, aircrafts a where c.aid=a.aid group by c.eid having count(*)>3;
3.select ename from employess
where salary<(select min(f.price) from
flights f where f.fromfl='bangalore' and f.tofl='frankfurt');
4.select a.aname, e.salary from aircrafts a,employess e, certified c where c.aid=a.aid and c.eid=e.eid and a.cruisingrange>1000 group by a.aid,a.aname; 
5.select distinct e.ename from employess e, certified c, aircrafts a where e.eid=c.eid and c.aid=a.aid and a.aname like 'boeing%';
6.select aid from aircrafts a
where a.cruisingrange>(select min(f.distance) from
flights f where f.fromfl='bengaluru' and f.tofl='delhi');
8.select e.ename, e.salary from employess e where e.eid not in ( select distinct c.eid from certified c ) and e.salary >( select avg (e1.salary) from employess e1 where e1.eid in ( select distinct c1.eid from certified c1 ) )
