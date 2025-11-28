use sql_testing;
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

select s.StudentID,StudentName,coursename,HODName  from StudentDetails  s join CourseDetails  c on s.StudentID = c.StudentID;
select count(s.StudentID) countofstudents,HODName  from StudentDetails  s join CourseDetails  c on s.StudentID = c.StudentID group by HODName;

select * from StudentDetails Where StudentID != (select StudentID from CourseDetails where coursename = "MS - Physics");

select StudentName,studentJoiningDate,coursename,HODName ,count(StudentName) from StudentDetails s join CourseDetails c on s.StudentID = c.StudentID group by HODName;