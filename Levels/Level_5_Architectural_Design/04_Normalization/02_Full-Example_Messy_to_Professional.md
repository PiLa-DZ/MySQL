1. The "Bad" Table (Denormalized)
    - +----------------------------------------------------------+
    - | ID | Student_Name | Course | Teacher  | Teacher_Email    |
    - +----------------------------------------------------------+
    - | 1  | Ahmed        | SQL    | Mr.Smith | smith@school.com |
    - | 2  | Sara         | SQL    | Mr.Smith | smith@school.com |
    - +----------------------------------------------------------+
    - Why is this bad? If Mr. Smith changes his email,
        - you have to update it in 1,000 rows. 
        - If you miss one, your data is corrupted (Update Anomaly)
2. The Normalized Solution (3NF)
```SQL
    -- 1. Teachers Table (Details about the teacher only)
    CREATE TABLE teachers (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100),
        email VARCHAR(100) UNIQUE
    );

    -- 2. Courses Table (Links to a teacher - One-to-Many)
    CREATE TABLE courses (
        id INT PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(100),
        teacher_id INT,
        FOREIGN KEY (teacher_id) REFERENCES teachers(id)
    );

    -- 3. Students Table
    CREATE TABLE students (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100)
    );

    -- 4. Enrollments (The Junction Table for Many-to-Many)
    CREATE TABLE enrollments (
        student_id INT,
        course_id INT,
        PRIMARY KEY (student_id, course_id),
        FOREIGN KEY (student_id) REFERENCES students(id),
        FOREIGN KEY (course_id) REFERENCES courses(id)
    );
```
