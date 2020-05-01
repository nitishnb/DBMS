create table actor(
    act_id int(20),
    act_name varchar(20),
    act_gender varchar(30),
    primary key(act_id)
    );
create table DIRECTOR (
    dir_id int(30),
    dir_name varchar(30),
    dir_phone int(30),
    primary key(dir_id)
    );
create table movies ( 
              mov_id int(30), 
               mov_title varchar(30), 
               mov_year int(30), 
              mov_lang varchar(30), 
            dir_id int(30),
           primary key(mov_id), 
         FOREIGN key(dir_id) REFERENCES director(dir_id) 
         );
create table movie_cast ( 
              act_id int(30), 
             mov_id int(30), 
             role varchar(30),
           FOREIGN KEY(act_id) REFERENCES actor
          FOREIGN key(mov_id) REFERENCES movies(mov_id) 
        );
  create table rating ( 
        mov_id int(30), 
       rev_stars int(30),
        foriegn key(mov_id) references movies(mov_id)               
 );
INSERT INTO actor VALUES ('101', 'sowmya', 'f');
INSERT INTO actor VALUES ('102', 'radha', 'f');
INSERT INTO actor VALUES ('103', 'raghav', 'm');
INSERT INTO actor VALUES ('104', 'sanjith', 'm');
INSERT INTO movie_cast VALUES ('101', '1001', 'heroine');
INSERT INTO movie_cast VALUES ('101', '1002', 'heroine');
INSERT INTO movie_cast VALUES ('103', '1003', 'hero');
INSERT INTO movie_cast VALUES ('103', '1002', 'guest');
INSERT INTO  movie_cast VALUES ('104', '1004', 'hero');
INSERT INTO director  VALUES ('50', 'rajmouli', '8861621844');
INSERT INTO director VALUES ('51', 'steven spielberg', '7760521044');
INSERT INTO director VALUES ('52', 'hitchcock', '9964786122');
INSERT INTO director VALUES ('53', 'karan', '8766488994');
INSERT INTO movies VALUES ('1001', 'kgf1', '2018', 'kannada', '51');
INSERT INTO movies VALUES ('1002', 'bulbul', '2016', 'kannada', '51');
INSERT INTO movies VALUES ('1003', 'bigil', '2019', 'tamil', '52');
INSERT INTO movies VALUES ('1004', 'immaiku', '2018', 'telagu', '52');
INSERT INTO rating VALUES ('1001', '4');
INSERT INTO rating VALUES ('1002', '2');
INSERT INTO rating VALUES ('1003', '5');
INSERT INTO rating VALUES ('1004', '4');


sql queries
1.select mov_title from movies where dir_id in (select dir_id from director where dir_name='Hitchcock');
2.select mov_title from movies m, movie_cast mv where m.mov_id=mv.mov_id and act_id in( select act_id from movie_cast group by act_id having count( act_id)>1) group by mov_title having count(*)>1;
3.select act_name from actor a join movie_cast c on a.act_id=c.act_id join movies m on c.mov_id=m.mov_id where m.mov_year not between 2000 and 2015;
4.select mov_title ,max(rev_stars) from movies inner join rating using(mov_id) group by mov_title having max(rev_stars)>0 order by mov_title;
5.update rating
set rev_stars=5 where mov_id
in(select mov_id from movies where dir_id
in(select dir_id from director where dir_name='Steven Spielberg'));
