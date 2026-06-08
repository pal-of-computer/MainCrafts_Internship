
-- SQL Data Analysis Internship – Task 1
-- Student Management Database
-- Organization: MainCrafts Technology

-- SECTION 1: DATABASE SETUP

create database if not exists StudentManagement;
-- creates a new database named StudentManagement if it not exits
use StudentManagement;
-- select the databases to run queries on them

create table Students (
    StudentID   int primary key auto_increment,
    Name        varchar(50),
    Gender      char(1),         -- 'M' = Male, 'F' = Female
    Age         int ,
    Grade       varchar(2),      -- e.g. 'A', 'B', 'C'
    MathScore   int,
    ScienceScore int,
    EnglishScore int
);
-- this creates a table in the StudentManagement database named as Students with the given parameters and datatypes and constraints


-- SECTION 2: INSERT DATA (12 Records)

insert into Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore) values
('Arpit Kapri',    'M', 17, 'A',  92, 88, 85),
('Mehul Singh',     'F', 16, 'A',  87, 91, 90),
('Rachit Yadav',     'M', 18, 'B',  74, 70, 78),
('Sneha Kapoor',    'F', 17, 'A',  95, 93, 89),
('Aniket Kumar',     'M', 16, 'C',  61, 65, 58),
('Divya Nair',      'F', 18, 'B',  78, 80, 82),
('Karan Joshi',     'M', 17, 'B',  83, 76, 74),
('Ananya Gupta',    'F', 16, 'A',  90, 88, 95),
('Vikas Yadav',     'M', 18, 'C',  55, 60, 63),
('Neha Patil',      'F', 17, 'B',  79, 72, 80),
('Rahul Tiwari',    'M', 16, 'C',  63, 58, 67),
('Ishita Bose',     'F', 18, 'A',  88, 94, 91);
-- this stmt (insert into) inserts the values in the above given parameters


-- SECTION 3: SQL QUERIES

-- Query 1: Show All Student Details
-- Retrieves every record from the Students table.

select * from Students;
-- '*' means each and every so select * from students; means show each and every rows and colums of the table students


-- Query 2: Average Score in Each Subject

select
    avg(MathScore) as Avg_Math,
    avg(ScienceScore) as Avg_Science,
    avg(EnglishScore) as Avg_English
from Students;
-- AVG(column_name(numeric_type)) finds the average of the specified column_name 


-- Query 3: Top Performer (Highest Total Score)

select
    Name,
    Grade,
    (MathScore + ScienceScore + EnglishScore) as TotalScore
from Students
order by TotalScore desc
limit 1;
-- order by toatascore desc mens we have to order the table in decreasing order on basis of totalscore and the limit 1 here means to restrict the number of rows to 1



-- Query 4: Count of Students Per Grade
-- Groups students by their Grade and counts each group.
-- Result: Shows how many students are in each grade category.

select
    Grade,
    count(*) as StudentCount
from Students
group by Grade
order by Grade;
-- group by is used to group the rows of the table on the basis of given column name hence count(*) will count the number of rows in the grouped data of the table


-- Query 5: Average Score by Gender

select
    Gender,
    avg(MathScore)  as Avg_Math,
    avg(ScienceScore) as Avg_Science,
    avg(EnglishScore) as Avg_English
from Students
group by Gender;
-- groups the whole table on basis of gender ie M and F into two parts and then calculates the avg of math, science and english of both the groups


-- Query 6: Students with MathScore > 80

select
    Name,
    Grade,
    MathScore
from Students
where MathScore > 80
order by MathScore desc;
--shows the name and grade of those students whose mathscore is greater than 80 and also in decreasing order


-- Query 7: Update a Student's Grade

update Students
set Grade = 'A'
where Name = 'Rachit Yadav';
-- it will update the grade to A from whatever it was in from of the give name that is 'Rachit Yadav'

-- Confirm the update:
SELECT StudentID, Name, Grade
FROM Students
WHERE Name = 'Rachit Yadav';

-- END OF TASK 1