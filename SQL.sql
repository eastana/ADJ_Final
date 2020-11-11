CREATE TABLE ADMINS(
   admin_id SERIAL PRIMARY KEY,
   username VARCHAR(32) UNIQUE,
   password VARCHAR(32)
);

CREATE TABLE MAJORS(
    major_id VARCHAR(5) PRIMARY KEY
);

CREATE TABLE GROUPS(
    major_id VARCHAR(5)
        REFERENCES MAJORS(MAJOR_ID)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    group_number INT,
    CONSTRAINT group_composite_key PRIMARY KEY(major_id, group_number)
);

CREATE TABLE STUDENTS(
    STUDENT_ID SERIAL PRIMARY KEY,
    student_fname VARCHAR(255),
    student_lname VARCHAR(255),
    year INT,
    username VARCHAR(32) UNIQUE,
    password VARCHAR(32),
    major_id VARCHAR(5),
    group_number INT,
    CONSTRAINT group_composite_key
        FOREIGN KEY(major_id, group_number)
        REFERENCES GROUPS(major_id, group_number)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CLUBS(
    club_id SERIAL PRIMARY KEY,
    club_name VARCHAR(255)
);

CREATE TABLE Clubs_Students(
    club_id INT REFERENCES CLUBS(CLUB_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    student_id INT REFERENCES STUDENTS(STUDENT_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE NEWS(
    news_id SERIAL PRIMARY KEY,
    news_title VARCHAR(255),
    news_description TEXT,
    moderator_id INT REFERENCES STUDENTS(STUDENT_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Events(
    event_id SERIAL PRIMARY KEY,
    event_name VARCHAR(255),
    event_start_date TIMESTAMP,
    event_end_date TIMESTAMP,
    event_creator_id INT REFERENCES STUDENTS(STUDENT_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Events_Students(
    event_id INT REFERENCES events(event_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    student_id INT REFERENCES STUDENTS(STUDENT_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);