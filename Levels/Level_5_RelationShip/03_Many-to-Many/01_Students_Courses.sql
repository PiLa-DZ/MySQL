-- == ======================================================
-- (Students and Courses)
-- The Logic:
-- 1. One Student can enroll in Many Courses.
-- 2. One Course can have Many Students enrolled in it.
-- == ======================================================

-- -- Step 1 Create ----------------------------------------
DROP TABLE IF EXISTS enrollments, courses, students;
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL
);
-- The Junction Table (The "Bridge")
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrolled_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    -- Composite Primary Key (Prevents a student from enrolling in the same course twice)
    PRIMARY KEY (student_id, course_id),
    -- Foreign Keys
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);

-- -- Step 2 Insert ----------------------------------------
INSERT INTO students (name) VALUES ('Ahmed'), ('Sara');
INSERT INTO courses (title) VALUES ('Database Design'), ('Web Development'), ('UI/UX');
-- Ahmed (1) takes Database (1) and Web (2)
INSERT INTO enrollments (student_id, course_id) VALUES (1, 1), (1, 2);
-- Sara (2) takes Web (2) and UI/UX (3)
INSERT INTO enrollments (student_id, course_id) VALUES (2, 2), (2, 3);

-- -- Step 3 Test ------------------------------------------
-- How to Query Many-to-Many
SELECT 
    s.name AS student_name, 
    c.title AS course_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id;
-- +--------------+-----------------+
-- | student_name | course_name     |
-- +--------------+-----------------+
-- | Ahmed        | Database Design |
-- | Ahmed        | Web Development |
-- | Sara         | Web Development |
-- | Sara         | UI/UX           |
-- +--------------+-----------------+
