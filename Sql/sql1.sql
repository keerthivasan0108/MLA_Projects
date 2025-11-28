
-- create

create database sql_testing;
use sql_testing;
create table BookDetailsOne(BookAuthor char(45),BookName char(50),BookType char(20),BookPages int(4),BookPrice double(6,2),BookID int(4));


insert into BookDetailsOne values("Rbond","The blue umbrella","Story",56,23.50,1234);
insert into BookDetailsOne values("ABCD","Core Java Fundamental","Technical",56,145.90,1878);
insert into BookDetailsOne values("Rbond","Time stops at shamli","Story",56,18.90,1786);
insert into BookDetailsOne values("ypk","C Fundamental","Technical",56,555.55,1216);
insert into BookDetailsOne values("Rbond","Java Fundamental","Technical",56,35.90,2700);
insert into BookDetailsOne values("Pallhavi Joshi","No time","Fiction",56,109.90,4321);
insert into BookDetailsOne values("ypk","C++ Fundamental","Technical",56,276.00,1111);
insert into BookDetailsOne values("Pallhavi Joshi","Out of box","Fiction",56,78.21,3434);
insert into BookDetailsOne values("ypk","C Fundamental","Non Fiction",56,55.89,1412);

select * from BookDetailsOne;

create table StudentDetails(StudentName char(30), StudentAge int(2),studentJoiningDate date,StudentID int(4));
insert into StudentDetails values("Bishnu Prasad",23,'2021-03-21',1143);
insert into StudentDetails values("Kalpita Patnaik",22,'2021-03-18',1146);
insert into StudentDetails values("Khayma",22,'2020-01-21',1078);
insert into StudentDetails values("Gayatri",25,'2021-06-23',1800);
insert into StudentDetails values("Palavi",21,'2021-01-21',1112);
insert into StudentDetails values("Siladitya",26,'2021-01-21',1147);
insert into StudentDetails values("Sivasish Panda",21,'2020-03-19',1090);
insert into StudentDetails values("Barada",25,'2020-04-05',1111);
insert into StudentDetails values("Pradeep P",22,'2021-06-07',1112);
insert into StudentDetails values("Puspha K",21,'2021-01-01',1149);
select * from StudentDetails;

create table CourseDetails(coursename char(20),HODName char(30),StudentID int(4));
insert into CourseDetails values("MS - Physics","Partha",1143);
insert into CourseDetails values("Msc - Mathematics","Sunil",1149);
insert into CourseDetails values("Msc - Zeology","Sudeepta",1800);
insert into CourseDetails values("MSC - Botany","Preethi",1001);
insert into CourseDetails values("BSC - Physics","Sujatha",1149);
select * from CourseDetails;

select count(*) from BookDetailsOne;

create table sample_tb(sid int(3),sname varchar(30));
desc sample_tb;
insert into sample_tb values(101,null);
insert into sample_tb (sname) values("hello");
insert into sample_tb values(103,"hi");

select count(*) from sample_tb where sid is not null;

select * from sample_tb where sname is not null order by sname;

select * from BookDetailsOne where BookType = 'Technical';

select * from BookDetailsOne where BookAuthor like 'R%';
select * from BookDetailsOne where BookAuthor like '%D';

select * from BookDetailsOne limit 4;
select * from BookDetailsOne limit 10 offset 4;


select count(*) from BookDetailsOne where BookPrice<100;
select count(*) as CountingBooks from BookDetailsOne where BookPrice<100;

select avg(BookPrice) as average ,max(BookPrice) as maximum,min(BookPrice) as minimum from BookDetailsOne;

select * from BookDetailsOne where BookPrice < (select avg(BookPrice) from BookDetailsOne);

select BookPrice from BookDetailsOne where BookAuthor = 'Rbond';
update BookDetailsOne set BookPrice = BookPrice+50 where BookAuthor='Rbond';

delete from BookDetailsOne where BookID = 1412;

delete from BookDetailsOne where BookType = 'Story';
select * from BookDetailsOne;


DELIMITER //

CREATE PROCEDURE ShowEmployees()
BEGIN
    SELECT * FROM BookDetailsOne;
    select * from BookDetailsOne order by BookAuthor;
END //

DELIMITER ;
call ShowEmployees();


set SQL_SAFE_UPDATES = 0;

drop procedure ShowEmployees;