CREATE DATABASE zenbootcamp;
USE zenbootcamp;

CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255) NOT NULL,
    course_description TEXT,
    course_duration INT, -- Duration of the course in weeks or months
    coordinator_id INT, -- Foreign key referencing BootcampCoordinator
    UNIQUE(course_name)
);

CREATE TABLE BootcampCoordinator (
    coordinator_id INT PRIMARY KEY AUTO_INCREMENT,
    coordinator_name VARCHAR(255) NOT NULL
);

CREATE TABLE Mentor (
    mentor_id INT PRIMARY KEY AUTO_INCREMENT,
    mentor_name VARCHAR(255) NOT NULL
);

CREATE TABLE Batch (
    batch_id INT PRIMARY KEY AUTO_INCREMENT,
    batch_name VARCHAR(255) NOT NULL,
    course_id INT, -- Foreign key referencing Course
    mentor_id INT, -- Foreign key referencing Mentor
    UNIQUE(batch_name),
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (mentor_id) REFERENCES Mentor(mentor_id)
);


CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(255) NOT NULL,
    batch_id INT, -- Foreign key referencing Batch
    FOREIGN KEY (batch_id) REFERENCES Batch(batch_id)
);


CREATE TABLE Lecture (
    lecture_id INT PRIMARY KEY AUTO_INCREMENT,
    lecture_date DATE,
    lecture_topic VARCHAR(255) NOT NULL,
    batch_id INT, -- Foreign key referencing Batch
    UNIQUE(lecture_date, batch_id),
    FOREIGN KEY (batch_id) REFERENCES Batch(batch_id)
);


CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    assignment_name VARCHAR(255) NOT NULL,
    course_id INT, -- Foreign key referencing Course
    assignment_deadline DATE,
    UNIQUE(assignment_name),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);


CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    lecture_id INT, -- Foreign key referencing Lecture
    student_id INT, -- Foreign key referencing Student
    feedback_text TEXT,
    FOREIGN KEY (lecture_id) REFERENCES Lecture(lecture_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);


CREATE TABLE MockInterview (
    interview_id INT PRIMARY KEY AUTO_INCREMENT,
    interview_date DATE,
    batch_id INT, -- Foreign key referencing Batch
    interviewer_name VARCHAR(255),
    FOREIGN KEY (batch_id) REFERENCES Batch(batch_id)
);


CREATE TABLE PlacementDrive (
    drive_id INT PRIMARY KEY AUTO_INCREMENT,
    drive_date DATE,
    batch_id INT, -- Foreign key referencing Batch
    drive_location VARCHAR(255),
    FOREIGN KEY (batch_id) REFERENCES Batch(batch_id)
);


CREATE TABLE AssignmentSubmission (
    submission_id INT PRIMARY KEY AUTO_INCREMENT,
    assignment_id INT, -- Foreign key referencing Assignment
    student_id INT, -- Foreign key referencing Student
    submission_date DATE,
    submission_text TEXT,
    FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
