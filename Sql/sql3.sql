CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);


INSERT INTO customers VALUES
(1,'John','Doe','john.doe@example.com','555-1010'),
(2,'Emily','Clark','emily.clark@example.com','555-2020'),
(3,'Michael','Stone','michael.stone@example.com','555-3030'),
(4,'Sarah','Lee','sarah.lee@example.com','555-4040'),
(5,'David','Brown','david.brown@example.com','555-5050'),
(6,'Olivia','Green','olivia.green@example.com','555-6060'),
(7,'Daniel','White','daniel.white@example.com','555-7070'),
(8,'Sophia','King','sophia.king@example.com','555-8080'),
(9,'James','Hall','james.hall@example.com','555-9090'),
(10,'Emma','Young','emma.young@example.com','555-1111');





CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO accounts VALUES
(101,1,'Savings',1500.50),
(102,2,'Checking',2300.00),
(103,3,'Savings',980.75),
(104,4,'Checking',1250.40),
(105,5,'Savings',5190.10),
(106,6,'Checking',320.00),
(107,7,'Savings',780.33),
(108,8,'Checking',4000.20),
(109,9,'Savings',1680.99),
(110,10,'Checking',220.00);


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(10,2),
    transaction_type VARCHAR(20),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

INSERT INTO transactions VALUES
(1001,101,200.00,'Deposit','2025-01-10'),
(1002,102,150.00,'Withdrawal','2025-02-02'),
(1003,103,500.00,'Deposit','2025-01-25'),
(1004,104,120.00,'Deposit','2025-03-02'),
(1005,105,700.00,'Withdrawal','2025-01-15'),
(1006,106,80.00,'Deposit','2025-02-28'),
(1007,107,250.00,'Withdrawal','2025-02-05'),
(1008,108,900.00,'Deposit','2025-03-03'),
(1009,109,300.00,'Withdrawal','2025-03-06'),
(1010,110,120.00,'Deposit','2025-03-10');


select * from customers;
select * from accounts;
select * from transactions;

create table tb1 (id int(3),name varchar(10));
drop table tb1;
create table tb2 (id int,coursename varchar(10));

insert into tb1 values(101,"gopi"),(102,"gopii");
insert into tb2 values(101,"physics"),(102,"coding");
insert into tb2 values(103,"maths"),(104,"java");

select * from tb1 join tb2 on tb1.id = tb2.id;

set SQL_SAFE_UPDATES = 0;
update tb1 set name = null where id = 102;
update tb2 set coursename = null where id = 101;

select * from tb1 left join tb2 on tb1.id = tb2.id;

select * from tb1 right join tb2 on tb1.id = tb2.id;

alter table tb1 add constraint primary key(id);
alter table tb2 add constraint primary key(id);
alter table tb1 add constraint foreign key(id) references tb2(id);

create table tb3 (tid int primary key , bookid int, foreign key (bookid) references tb2(id));