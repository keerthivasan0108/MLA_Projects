show databases;
create database Book;
use Book;

create table Books 
(Book_id int primary key,
Title varchar(100) Not null,
ISBN int unique not null,
Publication_year year not null,
Publisher_id int,
Category_id int,
Author_Name varchar(100) check(Author_Name != null),
foreign key(Category_id) references Categories(Category_id) on delete cascade,
foreign key(Publisher_id) references Publishers(Publisher_id) on delete cascade
);

create table Categories(
Category_id int primary key,
Category_Name varchar(100) not null
);

create table Publishers(
Publisher_id int primary key,
Publisher_Name varchar(100) not null
);

create table Users(
User_id int primary key,
User_Name varchar(100) not null,
Email varchar(100) unique not null,
Phone_Number bigint unique not null
);

create table Borrowings(
Borrow_id int primary key,
User_id int,
Book_id int,
Borrow_date date not null,
Return_date date not null,
foreign key(User_id) references Users(User_id) on delete cascade,
foreign key(Book_id) references Books(Book_id) on delete cascade
);

alter table Books modify column ISBN  Bigint;



INSERT INTO Categories (Category_id, Category_Name) VALUES
(201, 'Fiction'),
(202, 'Science'),
(203, 'History'),
(204, 'Technology'),
(205, 'Philosophy'),
(206, 'Art & Design'),
(207, 'Business & Management');


INSERT INTO Publishers (Publisher_id, Publisher_Name) VALUES
(301, 'Penguin Random House'),
(302, 'HarperCollins'),
(303, 'Oxford University Press'),
(304, 'O\'Reilly Media'),
(305, 'Cambridge University Press'),
(306, 'Simon & Schuster'),
(307, 'Macmillan Publishers');



INSERT INTO Books (Book_id, Title, ISBN, Publication_year, Publisher_id, Category_id, Author_Name) VALUES
(101, 'The Silent River', 978000001, 2018, 	301, 201, 'Mira Desai'),
(102, 'Quantum Basics', 978000002, 2020, 	302, 202, 'Dr. Anil Mehta'),
(103, 'Empire and Dawn', 978000003, 2015, 	303, 203, 'Rekha Sen'),
(104, 'Modern Python Patterns', 978000004, 2022, 304, 204, 'Karan Gupta'),
(105, 'Ethics in Everyday Life', 978000005, 2017, 305, 205, 'Neha Iyer'),
(106, 'Artificial Intelligence Simplified', 978000006, 2023, 304, 204, 'Rohan Malhotra'),
(107, 'The History of Civilizations', 978000007, 2016, 303, 203, 'Ananya Bose');


INSERT INTO Users (User_id, User_Name, Email, Phone_Number) VALUES
(401, 'Alice', 'aarav.sharma@example.com', 919876543210),
(402, 'Priya Kulkarni', 'priya.kulkarni@example.com', 919812345678),
(403, 'Rahul Verma', 'rahul.verma@example.com', 919700112233),
(404, 'Sneha Patil', 'sneha.patil@example.com', 919755667788),
(405, 'Vikram Rao', 'vikram.rao@example.com', 919744556677),
(406, 'Meera Joshi', 'meera.joshi@example.com', 919733445566),
(407, 'Kunal Deshpande', 'kunal.deshpande@example.com', 919722334455);



INSERT INTO Borrowings (Borrow_id, User_id, Book_id, Borrow_date, Return_date) VALUES
(501, 401, 101, '2025-10-01', '2025-10-15'),  -- User 401 borrows Book 101
(502, 402, 104, '2025-10-05', '2025-10-19'),  -- User 402 borrows Book 104
(503, 403, 102, '2025-10-07', '2025-10-21'),  -- User 403 borrows Book 102
(504, 401, 105, '2025-10-20', '2025-11-03'),  -- User 401 borrows again (repeat user)
(505, 405, 102, '2025-11-01', '2025-11-14'),  -- Book 102 borrowed again (repeat book)
(506, 402, 101, '2025-11-10', '2025-11-24');  -- User 402 repeats; Book 101 repeats)

update Users set User_Name = "Alice" where User_id = 401;

-- 1
select * from Categories;
select * from Publishers;
select * from Books;
select * from Users;
select * from Borrowings;

-- 2
select Categories.Category_Name, count(Books.Category_id) from Books join Categories  on Books.Category_id = Categories.Category_id group by Categories.Category_id having count(Books.Category_id) > 1;

-- 3
select  b.Title, p.Publisher_Name,b.Publication_year from Books b join Publishers p on b.Publisher_id = p.Publisher_id order by b.Publication_year desc;

-- 4
select u.User_Name,u.Email,u.Phone_Number from Users u join Borrowings b on u.User_id = b.User_id group by b.User_id having count(b.User_id) > 1;

-- 5
-- select b.Title from Books b join-- 

select u.User_id,u.User_Name, b.Title from Users u join Borrowings bw on u.User_id = bw.User_id join Books b on bw.Book_id = b.Book_id where u.User_Name = "Alice";

-- 6
select p.Publisher_Name,count(b.Book_id) as Count_of_books from Publishers p join Books b on p.Publisher_id = b.Publisher_id group by p.Publisher_id  order by p.Publisher_Name asc;



