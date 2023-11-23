CREATE TABLE instruments (
 instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(100) NOT NULL,
 is_available VARCHAR(100) NOT NULL
);

ALTER TABLE instruments ADD CONSTRAINT PK_instruments PRIMARY KEY (instrument_id);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_number UNIQUE VARCHAR(12) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 age INT,
 email VARCHAR(500),
 street VARCHAR(500) NOT NULL,
 zip VARCHAR(500) NOT NULL,
 city VARCHAR(500) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE phone (
 phone_no INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (phone_no,person_id);


CREATE TABLE price_category (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_cost INT,
 instructor_salary INT,
 discount INT
);

ALTER TABLE price_category ADD CONSTRAINT PK_price_category PRIMARY KEY (id);


CREATE TABLE student (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (person_id);


CREATE TABLE studio (
 studio_id UNIQUE VARCHAR(100) NOT NULL,
 street VARCHAR(500),
 zip VARCHAR(500),
 city VARCHAR(500),
 description VARCHAR(2000),
 available_times VARCHAR(500) NOT NULL
);

ALTER TABLE studio ADD CONSTRAINT PK_studio PRIMARY KEY (studio_id UNIQUE);


CREATE TABLE instructor (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 employment_id UNIQUE VARCHAR(500) NOT NULL,
 is_available VARCHAR(500) NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (person_id);


CREATE TABLE instruments_type (
 type VARCHAR(500) NOT NULL,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instruments_type ADD CONSTRAINT PK_instruments_type PRIMARY KEY (type,person_id);


CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 studio_id UNIQUE VARCHAR(500) NOT NULL,
 time TIMESTAMP(10)
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE rent_instrument (
 rent_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_id INT,
 rental_cost INT,
 person_id INT,
 rental_start TIMESTAMP(10),
 rental_end TIMESTAMP(10)
);

ALTER TABLE rent_instrument ADD CONSTRAINT PK_rent_instrument PRIMARY KEY (rent_id);


CREATE TABLE sibling (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (person_id,student_id);


CREATE TABLE skill_level (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 beginner VARCHAR(500),
 intermediate VARCHAR(500),
 advanced VARCHAR(500)
);

ALTER TABLE skill_level ADD CONSTRAINT PK_skill_level PRIMARY KEY (id);


CREATE TABLE ensembles (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 target_genre VARCHAR(500) NOT NULL,
 amount_of_students VARCHAR(500),
 min_of_students VARCHAR(500),
 max_of_students VARCHAR(500)
);

ALTER TABLE ensembles ADD CONSTRAINT PK_ensembles PRIMARY KEY (id);


CREATE TABLE group_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(500) NOT NULL,
 min_of_students VARCHAR(500),
 max_of_students VARCHAR(500),
 amount_of_students VARCHAR(500)
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id);


CREATE TABLE individual_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(500) NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (id);


ALTER TABLE phone ADD CONSTRAINT FK_phone_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instruments_type ADD CONSTRAINT FK_instruments_type_0 FOREIGN KEY (person_id) REFERENCES instructor (person_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (price_id) REFERENCES price_category (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (person_id) REFERENCES student (person_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (studio_id UNIQUE) REFERENCES studio (studio_id UNIQUE);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_3 FOREIGN KEY (person_id) REFERENCES instructor (person_id);


ALTER TABLE rent_instrument ADD CONSTRAINT FK_rent_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instruments (instrument_id);
ALTER TABLE rent_instrument ADD CONSTRAINT FK_rent_instrument_1 FOREIGN KEY (person_id) REFERENCES student (person_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (person_id) REFERENCES student (person_id);


ALTER TABLE skill_level ADD CONSTRAINT FK_skill_level_0 FOREIGN KEY (id) REFERENCES lesson (id);


ALTER TABLE ensembles ADD CONSTRAINT FK_ensembles_0 FOREIGN KEY (id) REFERENCES lesson (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (id) REFERENCES lesson (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (id) REFERENCES lesson (id);


