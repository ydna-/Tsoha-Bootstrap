CREATE TABLE Teacher(
    id SERIAL PRIMARY KEY,
    name varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    password varchar(50) NOT NULL
);

CREATE TABLE Course(
    id SERIAL PRIMARY KEY,
    name varchar(50) NOT NULL,
    term varchar(50) NOT NULL,
    teacher_id INTEGER REFERENCES Teacher(id)
);

CREATE TABLE Instructor(
    id SERIAL PRIMARY KEY,
    name varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    password varchar(50) NOT NULL,
    course_id INTEGER REFERENCES Course(id)
);

CREATE TABLE Student(
    id SERIAL PRIMARY KEY,
    student_number varchar(10) NOT NULL,
    course_number varchar(10) NOT NULL,
    course_id INTEGER REFERENCES Course(id)
);

CREATE TABLE Exercise(
    id SERIAL PRIMARY KEY,
    exercise_number INTEGER NOT NULL,
    course_id INTEGER REFERENCES Course(id)
);

CREATE TABLE Problem(
    id SERIAL PRIMARY KEY,
    problem_number INTEGER NOT NULL,
    exercise_id INTEGER REFERENCES Exercise(id)
);

CREATE TABLE ProblemReturn(
    mark char(1),
    problem_id INTEGER REFERENCES Problem(id),
    student_id INTEGER REFERENCES Student(id),
    PRIMARY KEY (problem_id, student_id)
);