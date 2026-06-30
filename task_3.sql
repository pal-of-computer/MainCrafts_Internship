--   SQL Data Analysis Internship - Task 3

--   1. TOP STUDENT PER COURSE

select
    c.id,
    c.name,
    e.student_id,
    s.Name,
    e.grade
from enrollments e
join courses  c ON c.id  = e.course_id
join students s ON s.StudentID = e.student_id
where e.grade = (
        select MAX(e2.grade)
        from enrollments e2
        where e2.course_id = e.course_id
      )
order by c.id;


--   2. PASS RATE PER COURSE  (pass = grade >= 40)

select
    c.id,
    c.name,
    count(*)     as total_students,
    sum(case when e.grade >= 40 then 1 else 0 end) as passed_students,
    round(
        sum(case when e.grade >= 40 then 1 else 0 end) * 100.0 / count(*),
        2
    ) as pass_rate_percent
from enrollments e
join courses c ON c.id = e.course_id
group by c.id, c.name
order by pass_rate_percent desc;


--   3. OVERALL TOPPER ACROSS ALL COURSES

select
    s.StudentID,
    s.Name,
    round(avg(e.grade), 2) as avg_grade
from enrollments e
join students s on s.StudentID = e.student_id
group by s.StudentID, s.Name
order by avg_grade desc
limit 1;


--   4. STUDENTS ENROLLED IN MULTIPLE COURSES

select
    s.StudentID,
    s.Name,
    count(e.course_id) as num_courses_enrolled
from enrollments e
join students s on s.StudentID = e.student_id
group by s.StudentID, s.Name
having count(e.course_id) > 1
order by num_courses_enrolled desc;

