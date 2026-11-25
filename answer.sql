-- School Management Database
-- Run this script in MySQL Workbench or the MySQL command line.

CREATE DATABASE IF NOT EXISTS school_management;
USE school_management;

CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    enrollment_date DATE NOT NULL
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    teacher_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE enrollments (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    grade VARCHAR(2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO teachers (first_name, last_name, email) VALUES
    ('Maya', 'Patel', 'maya.patel@example.com'),
    ('James', 'Okafor', 'james.okafor@example.com');

INSERT INTO students (first_name, last_name, email, date_of_birth, enrollment_date) VALUES
    ('Ava', 'Chen', 'ava.chen@example.com', '2008-04-12', '2025-09-01'),
    ('Noah', 'Garcia', 'noah.garcia@example.com', '2007-11-03', '2025-09-01');

INSERT INTO courses (course_name, teacher_id) VALUES
    ('Mathematics', 1),
    ('Science', 2);

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade) VALUES
    (1, 1, '2025-09-02', 'A'),
    (1, 2, '2025-09-02', 'B'),
    (2, 1, '2025-09-02', 'B');

-- View students and the courses they are enrolled in.
SELECT
    students.first_name,
    students.last_name,
    courses.course_name,
    enrollments.grade
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
JOIN courses ON enrollments.course_id = courses.course_id;
