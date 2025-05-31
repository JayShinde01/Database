

use jay;
create table students(

student_id int primary key auto_increment,
name varchar(255),
age int,
city varchar(255)

);
insert into students(name,age,city)values("Alice",20,"New York"),("bob",22,"loss Angelus"),
("charli",21,"chikago"),("diayna",23,"miami"),("ethan",20,"New York");
create table profile(

profile_id int primary key auto_increment,
student_id int,
mail varchar(255),
gpa int,
foreign key(student_id) references students(student_id)
);

insert into profile(student_id,mail,gpa)values(1,"alice@gmail.com",3.6),
(2,"bob@gmail.com",3.1),(3,"charli@gmail.com",2.9),(4,"diana@gmail.com",3.8),
(5,"ethan@gmail.com",3.4);

-- Q1. Select all students who are from New York.
select * from students where city="New York";

-- Q2. Get top 3 students with highest GPA.
select name,gpa from students s Join profile p on s.student_id=p.student_id
order by gpa desc limit 3;

-- Q3. Count how many students are from each city.
select count(*),city from students 
group by city;

-- Q4. Get student names along with their GPA
select name,gpa from students s Join profile p on s.student_id=p.student_id;

-- Q5. Get all students and their emails.
select name,mail from students s Join profile p on s.student_id=p.student_id;

-- Q6. Find students with GPA greater than 3.5.
select name,gpa from students s Join profile p on s.student_id=p.student_id
where gpa>3.5;

-- Q7. Find average GPA of students from each city.
select city,avg(gpa) from students s Join profile p on s.student_id=p.student_id
group by city;








use jay;
create table books(
book_id int,
title varchar(255),
genre varchar(255),
author_id int ,
foreign key (author_id) references authors(author_id)
);

create table authors(
author_id int primary key auto_increment,
name varchar(255),
country varchar(255)
);
insert into authors(name,country)values
("J.K","UK"),("george","UK"),("mark","USA"),("haruki","Japan");
insert into books(book_id,title,genre,author_id)values
(101,"harry porter and scorer stone","fantasy",1),
(102,"harry porter and chamber secrete","fantasy",1),
(103,"1984","dystopian",2),
(104,"animal farm","satire",2),
(105,"adventures","fiction",3),
(106,"wood","romance",4),
(101,"shore","magical realism",4),
(101,"bird cronical","fiction",4);
select * from books;
select * from authors;

-- 1. How many books has each author written?
select count(*) from books b Join authors  a on b.author_id=a.author_id group by name;

-- 2. List the titles of books written by Haruki Murakami.
select title,name  from books b Join authors  a on b.author_id=a.author_id where name="haruki";

-- 3. Which authors have written more than one book?
select count(*) as c,name  from books b Join authors  a on b.author_id=a.author_id group by name having c >1;

-- 4. List all authors and the genres they have written.
select genre  from books b Join authors  a on b.author_id=a.author_id group by genre;		

-- 5. How many different genres has each author written in?
select genre  from books b Join authors  a on b.author_id=a.author_id group by genre  ;	

-- 6. Which author has written the most books?
select count(*)as c  from books b Join authors  a on b.author_id=a.author_id group by name order by c desc limit 1;	

-- 7. List all books along with their author’s name and country.
select title,name,country from books b left Join authors  a on b.author_id=a.author_id ;

-- 8. Which authors have written books in the genre ‘Fiction’?
select title,name,genre from books b  Join authors  a on b.author_id=a.author_id where genre="fiction";

-- 9. Find the number of books written by UK authors.
select count(*),country from books b  Join authors  a on b.author_id=a.author_id group by country having country="uk";

-- 10. List authors who have written books in more than one genre.
select count(*) from books b left Join authors  a on b.author_id=a.author_id where (
select distinct  name,genre from books b left Join authors  a on b.author_id=a.author_id   
)  ;
