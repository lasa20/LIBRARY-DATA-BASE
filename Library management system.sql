--Library Management system--

--Creating the branch table--

Drop table if exists Branch;

create table Branch
				(branch_id varchar(10) Primary key,
				manager_id varchar(10),
				branch_address	varchar(15),
				contact_no varchar(10));

Alter table Branch
Alter column contact_no type varchar(20);

Drop table if exists Employees;

create table Employees
					(emp_id	varchar(5) Primary key,
					emp_name varchar(20),
					position varchar(10),
					salary int,
					branch_id varchar(5)
					);

Alter table Employees
Alter column emp_id type varchar (10),
Alter column emp_name type varchar (25),
Alter column position type varchar (15),
Alter column branch_id type varchar (25);

Drop table if exists Books;

create table Books 
				(isbn varchar(20) Primary key,
				book_title	varchar(55),
				category varchar(20),
				rental_price float,
				status varchar (10),
				author varchar (25),
				publisher varchar (25)
				);
Alter table Books 
Alter column book_title type varchar(75),
Alter column status type varchar (15),
Alter column author type varchar (35),
Alter column publisher type varchar (55),
Alter column category type varchar (25);

Drop table if exists Members;

create table Members
					(member_id varchar(5) Primary key,
					member_name	varchar(15),
					member_address varchar(15),
					reg_date date
					);

Drop table if exists Return_status;

create table Return_status
						(return_id	varchar(5) Primary key,
						issued_id	varchar(5),
						return_book_name varchar(55),
						return_date date,
						return_book_isbn varchar(20)
						);

Drop table if exists Issue_status;

create table Issue_status
						(issued_id	varchar(5) Primary key,
						issued_member_id varchar(5),	
						issued_book_name varchar(15),
						issued_date	date,
						issued_book_isbn varchar(20),
						issued_emp_id varchar(5)
						);

--FOREIGN KEY CONSTRAINTS--

Alter table Issue_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

Alter table Issue_status
add constraint fk_book_isbn
foreign key (issued_book_isbn)
references Books(isbn);

Alter table Issue_status
add constraint fk_employee_id
foreign key (issued_emp_id)
references employees(emp_id);

Alter table Employees
add constraint fk_branch
foreign key (branch_id)
references  Branch(branch_id);

Alter table Return_status
add constraint fk_issue_id
foreign key (issued_id)
references Issue_status(issued_id);