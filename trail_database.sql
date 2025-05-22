

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

group by city;