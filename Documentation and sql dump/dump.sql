CREATE DATABASE EduDay;

USE EduDay;
create table Users (
	email VARCHAR(50) PRIMARY KEY
	, password VARCHAR(20)
	, fname VARCHAR(20)
	, lname VARCHAR(20)
	, points Double 
	
);

insert into Users values ('maximo@act.edu', 'user', 'Maximo', 'Glitsky', 0);
insert into Users values ('rossie@act.edu', 'user', 'Rossie', 'Nixon', 0);
insert into Users values ('rogelio@act.edu', 'user', 'Rogelio', 'Wager', 0);
insert into Users values ('loise@act.edu', 'user', 'Loise', 'Choate', 0);

create table Courses (
	course_ID Double NOT NULL AUTO_INCREMENT  PRIMARY KEY,
	name VARCHAR(200),
	course_level VARCHAR(50),
	chapter1 VARCHAR(200),
	chapter2 VARCHAR(200),
	chapter3 VARCHAR(200), 
	chapter4 VARCHAR(200),
	chapter5 VARCHAR(200),
	chapter6 VARCHAR(200),
	email VARCHAR(50),
	CONSTRAINT instructor_fk FOREIGN KEY (email) REFERENCES Instructors (email)
	
);


insert into Courses values (1, 'Introduction to Artificial Intelligence', 'intro', 'What is AI?', 'History of AI', 'Logical AI', 'Pattern recognition', 'Search', 'Learning from experience', 'ng@act.edu');
insert into Courses values (2, 'Introduction to Machine Learning', 'intro', 'What is Machine Learning?', 'History of ML', 'Computer Vision', 'Speech Recognition', 'Pattern recognition', 'Natural Language Processing', 'ng@act.edu');
insert into Courses values (3, 'Artificial neural Networks', 'medium', 'What are neural networks?', 'History of neural networks', 'Simple Neural Networks', 'Convolutional Natural Networks', 'Recurrent Neural Networks', 'Generative Adversarial Networks', 'ng@act.edu');
insert into Courses values (4, 'Deep Learning', 'advanced', 'Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'ng@act.edu');
insert into Courses values (5, 'Introduction to Java', 'intro', 'Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'bosua@act.edu');
insert into Courses values (6, 'Introduction to Web Development', 'intro', 'Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'bosua@act.edu');
insert into Courses values (7, 'Introduction to PHP', 'intro', 'Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'bosua@act.edu');
insert into Courses values (8, 'Introduction to C#', 'intro', 'Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'nolan@act.edu');
insert into Courses values (9, 'Introduction to Object Oriented Programming', 'intro', 'Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'nolan@act.edu');
insert into Courses values (10, 'Advanced Object Oriented Programming', 'advanced', 'Chapter 1', 'Chapter 2', 'Chapter 3', 'Chapter 4', 'Chapter 5', 'Chapter 6', 'nolan@act.edu');



create table Instructors  (
	email VARCHAR(50) PRIMARY KEY
	, password VARCHAR(20)
	, fname VARCHAR(20)
	, lname VARCHAR(20)
	
	
);

insert into Instructors values ('ng@act.edu', 'instructor', 'Andrew', 'Ng');
insert into Instructors values ('bosua@act.edu', 'instructor', 'Josh', 'Bosua');
insert into Instructors values ('nolan@act.edu', 'instructor', 'Dan', 'Nolan');


create table User_course  (
	uc_id Double NOT NULL AUTO_INCREMENT  PRIMARY KEY
	, c_id Double
	, email VARCHAR(50)
	, grade VARCHAR(25)
	, CONSTRAINT email_user_fk FOREIGN KEY (email) REFERENCES Users (email)
	, CONSTRAINT uc_c_fk FOREIGN KEY (c_id) REFERENCES Courses (c_id)	
	
		
);


insert into User_course values (1, 1, 'maximo@act.edu', 'F');
insert into User_course values (2, 1, 'rossie@act.edu', 'F');
insert into User_course values (3, 1, 'rogelio@act.edu', 'F');
insert into User_course values (4, 1, 'loise@act.edu', 'F');
insert into User_course values (5, 2, 'maximo@act.edu', 'F');
insert into User_course values (6, 2, 'rossie@act.edu', 'F');
insert into User_course values (7, 2, 'rogelio@act.edu', 'F');
insert into User_course values (8, 2, 'loise@act.edu', 'F');
insert into User_course values (9, 3, 'maximo@act.edu', 'F');
insert into User_course values (10, 3, 'rossie@act.edu', 'F');
insert into User_course values (11, 3, 'rogelio@act.edu', 'F');
insert into User_course values (12, 3, 'loise@act.edu', 'F');



create table Skills  (
	skill VARCHAR(20) PRIMARY KEY
	, field VARCHAR(100)	
);


insert into Skills values ('ai', 'ai');
insert into Skills values ('ml', 'ai');
insert into Skills values ('java', 'prog lang intro');
insert into Skills values ('php', 'prog lang intro');
insert into Skills values ('html', 'web dev');
insert into Skills values ('javascript', 'web dev');
insert into Skills values ('c#', 'prog lang intro');
insert into Skills values ('oop', 'oop');



create table Course_skill (
	cs_id Double NOT NULL AUTO_INCREMENT  PRIMARY KEY
	, c_id Double
	, skill VARCHAR(20)
	, CONSTRAINT cs_c_fk FOREIGN KEY (c_id) REFERENCES Courses (c_id)
	, CONSTRAINT uc_s_fk FOREIGN KEY (skill) REFERENCES Skills (skill)	
			
);

insert into Course_skill values (1, 1, 'ai');
insert into Course_skill values (2, 2, 'ai');
insert into Course_skill values (3, 3, 'ai');
insert into Course_skill values (4, 4, 'ai');
insert into Course_skill values (5, 5, 'java');
insert into Course_skill values (6, 6, 'html');
insert into Course_skill values (7, 6, 'css');
insert into Course_skill values (8, 6, 'javascript');
insert into Course_skill values (9, 7, 'php');
insert into Course_skill values (10, 8, 'c#');
insert into Course_skill values (11, 9, 'oop');
insert into Course_skill values (12, 10, 'oop');


create table Quizzes (
	c_id Double,
	quiz_number Int,
	name VARCHAR(200),
	q1 VARCHAR(200), 
	q2 VARCHAR(200),
	q3 VARCHAR(200),
	q4 VARCHAR(200),
	q4_1 VARCHAR(50),
	q4_2 VARCHAR(50),
	q4_3 VARCHAR(50),
	q4_answer VARCHAR(50),
	PRIMARY KEY (c_id, quiz_number)
		
);


insert into Quizzes values (1, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (1, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (1, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

insert into Quizzes values (2, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (2, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (2, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

insert into Quizzes values (3, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (3, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (3, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

insert into Quizzes values (4, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (4, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (4, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

insert into Quizzes values (5, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (5, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (5, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

insert into Quizzes values (6, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (6, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (6, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

insert into Quizzes values (7, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (7, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (7, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

insert into Quizzes values (8, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (8, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (8, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

insert into Quizzes values (9, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (9, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (9, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

insert into Quizzes values (10, 1, 'Quiz 1', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (10, 2, 'Quiz 2', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');
insert into Quizzes values (10, 3, 'Quiz 3', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'Is this a real question?', 'first', 'second', 'third', 'second');

create table User_quiz (
	c_id Double,
	email VARCHAR(50),
	quiz_number Int,
	points Int,
	PRIMARY KEY (c_id, email, quiz_number),
	CONSTRAINT user_quiz_fk FOREIGN KEY (c_id) REFERENCES Courses (c_id),
	CONSTRAINT email_quiz_fk FOREIGN KEY (email) REFERENCES Users (email)
		
);

