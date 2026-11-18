
CREATE DATABASE student_management;

USE student_management;


CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    hod_name VARCHAR(100),
    location VARCHAR(50)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    gender VARCHAR(10),
    date_of_birth DATE,
    department_id INT,
    admission_date DATE,
    city VARCHAR(50),
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE,
    department_id INT,
    semester INT,
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);


CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    marks_obtained DECIMAL(5,2),
    exam_type VARCHAR(30),
    exam_date DATE,
    FOREIGN KEY (student_id)
    REFERENCES students(student_id),
    FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
);


CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    attendance_date DATE,
    status ENUM('Present','Absent','Late'),
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);

CREATE TABLE fees (
    fee_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    total_fee DECIMAL(10,2),
    paid_amount DECIMAL(10,2),
    payment_date DATE,
    payment_status ENUM('Paid','Pending','Partial'),
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
);

show tables;
-- --------------------------------------------department table data----------------------------------------------------------
INSERT INTO departments
(department_name, hod_name, location)
VALUES
('CSE', 'Ramesh Kumar', 'Block A'),
('AIML', 'Suresh Kumar', 'Block B'),
('ECE', 'Prasad Rao', 'Block C'),
('EEE', 'Krishna Rao', 'Block D'),
('MECH', 'Ravi Kumar', 'Block E');

-- ------------------------------------------student table data---------------------------------------------------------------------
INSERT INTO students
(first_name, last_name, email, phone, gender,
date_of_birth, department_id, admission_date, city)
VALUES
('Mani', 'Reddy', 'mani@gmail.com', '9876543210', 'Male', '2004-05-12', 2, '2023-07-10', 'Andhra Pradesh'),
('Ravi', 'Kumar', 'ravi@gmail.com', '9876543211', 'Male', '2003-08-15', 1, '2022-07-10', 'Hyderabad'),
('Priya', 'Sharma', 'priya@gmail.com', '9876543212', 'Female', '2004-01-20', 2, '2023-07-10', 'Chennai'),
('Kiran', 'Rao', 'kiran@gmail.com', '9876543213', 'Male', '2003-11-25', 3, '2022-07-10', 'Vijayawada'),
('Sneha', 'Reddy', 'sneha@gmail.com', '9876543214', 'Female', '2004-03-18', 1, '2023-07-10', 'Guntur'),
('Arjun', 'Varma', 'arjun@gmail.com', '9876543215', 'Male', '2003-06-22', 4, '2022-07-10', 'Nellore'),
('Divya', 'Lakshmi', 'divya@gmail.com', '9876543216', 'Female', '2004-09-10', 5, '2023-07-10', 'Ongole'),
('Rahul', 'Verma', 'rahul@gmail.com', '9876543217', 'Male', '2003-12-05', 2, '2022-07-10', 'Tirupati'),
('Pooja', 'Devi', 'pooja@gmail.com', '9876543218', 'Female', '2004-04-14', 3, '2023-07-10', 'Kadapa'),
('Suresh', 'Babu', 'suresh@gmail.com', '9876543219', 'Male', '2003-02-28', 1, '2022-07-10', 'Chittoor');


-- -------------------------------------------course table data-----------------------------------------------------------------

INSERT INTO courses
(course_name, course_code, department_id, semester)
VALUES
('Python Programming', 'CS101', 1, 1),
('Database Management', 'CS102', 1, 2),
('Machine Learning', 'AI101', 2, 3),
('Deep Learning', 'AI102', 2, 4),
('Artificial Intelligence', 'AI103', 2, 5),
('Digital Electronics', 'EC101', 3, 2),
('Communication Systems', 'EC102', 3, 3),
('Electrical Machines', 'EE101', 4, 2),
('Power Systems', 'EE102', 4, 3),
('Engineering Mechanics', 'ME101', 5, 1);



-- -----------------------------------------marks table data---------------------------------------------------------------------

INSERT INTO marks
(student_id, course_id, marks_obtained, exam_type, exam_date)
VALUES
(1, 3, 90, 'Midterm', '2026-10-10'),
(2, 1, 85, 'Midterm', '2026-10-10'),
(3, 4, 95, 'Final', '2026-10-15'),
(4, 6, 72, 'Midterm', '2026-10-10'),
(5, 2, 88, 'Final', '2026-10-15'),
(6, 8, 65, 'Midterm', '2026-10-10'),
(7, 10, 78, 'Final', '2026-10-15'),
(8, 5, 92, 'Final', '2026-10-15'),
(9, 7, 81, 'Midterm', '2026-10-10'),
(10, 2, 55, 'Final', '2026-10-15');


-- -----------------------------------------------attendance table data---------------------------------------------------------------

INSERT INTO attendance
(student_id, attendance_date, status)
VALUES
(1, '2026-11-17', 'Present'),
(2, '2026-11-17', 'Absent'),
(3, '2026-11-17', 'Present'),
(4, '2026-11-17', 'Late'),
(5, '2026-11-17', 'Present'),
(6, '2026-11-17', 'Absent'),
(7, '2026-11-17', 'Present'),
(8, '2026-11-17', 'Present'),
(9, '2026-11-17', 'Late'),
(10, '2026-11-17', 'Present');


-- ----------------------------------------------fees table data----------------------------------------------------------------

INSERT INTO fees
(student_id, total_fee, paid_amount, payment_date, payment_status)
VALUES
(1, 50000, 50000, '2026-11-01', 'Paid'),
(2, 50000, 20000, '2026-11-02', 'Partial'),
(3, 50000, 50000, '2026-11-03', 'Paid'),
(4, 50000, 0, NULL, 'Pending'),
(5, 50000, 30000, '2026-11-04', 'Partial'),
(6, 50000, 0, NULL, 'Pending'),
(7, 50000, 50000, '2026-11-05', 'Paid'),
(8, 50000, 40000, '2026-11-06', 'Partial'),
(9, 50000, 50000, '2026-11-07', 'Paid'),
(10, 50000, 0, NULL, 'Pending');

-- ---------------------------------completed tables creation-----------------------------------------------------------------------------

- ------------------------------------queries for students table--------------------------------------------------------------------------
-- 1. Students table lo all records display cheyyi.
select * from students;
-- 2. Students first_name and last_name display cheyyi.
select first_name,last_name from students;
-- 3. AIML department students display cheyyi.
select * from departments where department_name='aiml';
-- 4. Female students display cheyyi.
select * from students where gender='female';
-- 5. Hyderabad city students display cheyyi.
select * from students where city='hyderabad';
-- 6. Students names alphabetical order lo display cheyyi.
select * from students order by first_name;
-- 7. First 5 students display cheyyi.
select * from students limit 5;
-- 8. 2022 tarvatha admission ayina students display cheyyi.
select * from students where admission_date > '2022-12-30';
-- 9. Total students count find cheyyi.
select count(*) from students;
-- 10. Students details lo unique cities display cheyyi.
select distinct(city) from students;


-- ------------------------------------------queries for department table---------------------------------------
-- 11. All departments display cheyyi.
select * from departments;
-- 12. Department names matrame display cheyyi.
select department_name from departments;
-- 13. CSE department details display cheyyi.
select* from departments where department_name='cse';
-- 14. Total departments count find cheyyi.
select count(*) from departments;
-- 15. Departments ni alphabetical order lo display cheyyi.
select * from departments order by department_name;

-- -----------------------------------------queries fro course table----------------------------------------------

-- 16. All courses display cheyyi.
select * from courses;
-- 17. Course names and course codes display cheyyi.
select course_name,course_code from courses;
show tables;
-- 18. AIML department courses display cheyyi.
select department_name as d,course_name as c 
from 
departments d join courses c 
on 
d.department_id=c.department_id where department_name='aiml';

-- 19. 3rd semester courses display cheyyi.
select course_name from courses where semester=3;
-- 20. Total courses count find cheyyi.
select count(course_name) no_of_courses from courses;



-- ----------------------------------------queries for marks table-----------------------------------------------
select * from marks;
-- 21. All students marks display cheyyi.
select student_id,marks_obtained from marks;
-- 22. 80 kanna ekkuva marks vachina records display cheyyi.
select * from marks where marks_obtained > 80;
-- 23. Highest marks find cheyyi.
select max(marks_obtained) from marks;
-- 24. Lowest marks find cheyyi.
select min(marks_obtained) from marks;
-- 25. Average marks calculate cheyyi.
select avg(marks_obtained) from marks;
-- 26. Final exam marks display cheyyi.
select marks_obtained  from marks where exam_type = 'final';


-- --------------------------------------queires for attendance table--------------------------------------------

-- 27. All attendance records display cheyyi.
select * from attendance;
-- 28. Present students records display cheyyi.
select * from attendance where status ='present';
-- 29. Absent students records display cheyyi.
select * from attendance where status ='absent';
-- 30. Total attendance records count cheyyi.
select count(*) from attendance;


-- --------------------------------------------queries fro fees table--------------------------------------------

-- 31. All fee records display cheyyi.
select * from fees;
-- 32. Paid students records display cheyyi.
select * from fees where payment_status='paid';
-- 33. Pending fee students display cheyyi.
select * from fees where payment_status='pending';
-- 34. Total paid amount calculate cheyyi.
select sum(total_fee) from fees where payment_status='paid';
-- 35. Total pending amount calculate cheyyi.
select sum(total_fee) from fees where payment_status='pending';
