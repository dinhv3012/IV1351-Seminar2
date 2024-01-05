CREATE TABLE email (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email VARCHAR(500) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (id);


CREATE TABLE instruments (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(100) NOT NULL,
 brand VARCHAR(500),
 rent_fee VARCHAR(500)
);

ALTER TABLE instruments ADD CONSTRAINT PK_instruments PRIMARY KEY (id);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_number VARCHAR(12) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 age INT,
 street VARCHAR(500) NOT NULL,
 zip VARCHAR(500) NOT NULL,
 city VARCHAR(500) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE person_email (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 email_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE person_email ADD CONSTRAINT PK_person_email PRIMARY KEY (person_id,email_id);


CREATE TABLE phone (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_no VARCHAR(500) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE price_category (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_type_fee INT,
 instructor_salary INT,
 sibling_discount INT,
 skill_level_fee INT
);

ALTER TABLE price_category ADD CONSTRAINT PK_price_category PRIMARY KEY (id);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_sibling_ids (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 sibling_student_id INT
);

ALTER TABLE student_sibling_ids ADD CONSTRAINT PK_student_sibling_ids PRIMARY KEY (id);


CREATE TABLE student_siblings (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 siblings_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE student_siblings ADD CONSTRAINT PK_student_siblings PRIMARY KEY (student_id,siblings_id);


CREATE TABLE studio (
 studio_id VARCHAR(100) NOT NULL,
 street VARCHAR(500),
 zip VARCHAR(500),
 city VARCHAR(500),
 description VARCHAR(2000),
 available_times VARCHAR(500) NOT NULL
);

ALTER TABLE studio ADD CONSTRAINT PK_studio PRIMARY KEY (studio_id);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT NOT NULL,
 employment_id VARCHAR(500) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instruments_type (
 instrument_teaches_type VARCHAR(500) NOT NULL,
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instruments_type ADD CONSTRAINT PK_instruments_type PRIMARY KEY (instrument_teaches_type,instructor_id);


CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price_id INT NOT NULL,
 studio_id VARCHAR(500),
 instrument_type VARCHAR(500) NOT NULL,
 min_of_students INT,
 max_of_students INT,
 amount_of_students INT,
 time TIMESTAMP(6),
 target_genre VARCHAR(500) NOT NULL,
 student_id INT NOT NULL,
 lesson_type VARCHAR(500),
 skill_level VARCHAR(500)
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE lesson_teaches (
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE lesson_teaches ADD CONSTRAINT PK_lesson_teaches PRIMARY KEY (instructor_id,lesson_id);


CREATE TABLE person_phone (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE person_phone ADD CONSTRAINT PK_person_phone PRIMARY KEY (person_id,phone_id);


CREATE TABLE rent_instrument (
 rent_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT NOT NULL,
 rental_start TIMESTAMP(6),
 rental_end TIMESTAMP(6),
 student_id INT NOT NULL
);

ALTER TABLE rent_instrument ADD CONSTRAINT PK_rent_instrument PRIMARY KEY (rent_id);


CREATE TABLE student_lesson (
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE student_lesson ADD CONSTRAINT PK_student_lesson PRIMARY KEY (student_id,lesson_id);


ALTER TABLE person_email ADD CONSTRAINT FK_person_email_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_email ADD CONSTRAINT FK_person_email_1 FOREIGN KEY (email_id) REFERENCES email (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE student_siblings ADD CONSTRAINT FK_student_siblings_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_siblings ADD CONSTRAINT FK_student_siblings_1 FOREIGN KEY (siblings_id) REFERENCES student_sibling_ids (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instruments_type ADD CONSTRAINT FK_instruments_type_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (price_id) REFERENCES price_category (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (studio_id) REFERENCES studio (studio_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE lesson_teaches ADD CONSTRAINT FK_lesson_teaches_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE lesson_teaches ADD CONSTRAINT FK_lesson_teaches_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_1 FOREIGN KEY (phone_id) REFERENCES phone (id);


ALTER TABLE rent_instrument ADD CONSTRAINT FK_rent_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instruments (id);
ALTER TABLE rent_instrument ADD CONSTRAINT FK_rent_instrument_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_lesson ADD CONSTRAINT FK_student_lesson_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


