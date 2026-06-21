-- Student Management Database (Task 2)
-- 1. EXTEND DB

Create table courses (
    id  int primary key auto_increment,
    name varchar(100) not null
);

Create table enrollments (
    student_id int not null,
    course_id  int not null,
    grade int not null,
    foreign key (student_id) references students(StudentID),
    foreign key (course_id) references courses(id)
);

Insert into courses (name) values
    ('Mathematics'),
    ('Science'),
    ('English');

Insert into enrollments (student_id, course_id, grade) values
    (1, 1, 85.0), (1, 2, 78.0), (1, 3, 90.0),
    (2, 1, 35.0), (2, 2, 60.0), (2, 3, 72.0),
    (3, 1, 92.0), (3, 2, 88.0), (3, 3, 95.0),
    (4, 1, 38.0), (4, 2, 45.0), (4, 3, 50.0),
    (5, 1, 70.0), (5, 2, 65.0), (5, 3, 60.0);


-- 2. SQL QUERIES
-- 2.1 List all students enrolled in each course
Select 
    c.id            as course_id,
    c.name          as course_name,
    s.StudentID     as student_id,
    s.Name          as student_name
from courses c
join enrollments e on e.course_id = c.id
join Students s on s.StudentID = e.student_id
order by c.id, s.StudentID;

-- 2.2 Find average grade per course
select
    c.id    as course_id,
    c.name  as course_name,
    round(avg(e.grade), 2) as average_grade
from courses c
join enrollments e on e.course_id = c.id
group by c.id, c.name
order by c.id;

-- 2.3 Find top 3 students overall 
Select 
    s.StudentID,
    s.Name AS student_name,
    ROUND(AVG(e.grade), 2) AS average_grade
From Students s
Join enrollments e on e.student_id = s.StudentID
Group by s.StudentID, s.Name
Order by average_grade desc
Limit 3;

-- 2.4 Count students who failed (grade < 40)
Select count (*) as failed_enrollments
From enrollments
Where grade < 40;


