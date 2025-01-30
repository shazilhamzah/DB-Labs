----------- QUESTION 1 ------------
CREATE TABLE Student(
	RollNum VARCHAR(10),
	Name VARCHAR(255),
	Gender VARCHAR(1),
	Phone VARCHAR(11)
);

CREATE TABLE Attendance(
	RollNum VARCHAR(10),
	ADate Date,
	AStatus VARCHAR(1),
	ClassVenue INT
);

CREATE TABLE ClassVenue(
	ID INT,
	Building VARCHAR(30),
	RoomNum INT,
	Teacher VARCHAR(255)
);

CREATE TABLE Teacher(
	Name VARCHAR(255),
	Gender VARCHAR(255),
	Department VARCHAR(255)
);

INSERT INTO Student 
VALUES 
('L164124','Rafia Ahmed','F','0333234354');

INSERT INTO Attendance
VALUES
('L164124','2-23-2016','A',1),
('L164125','3-4-2016','P',2);

INSERT INTO ClassVenue
VALUES 
(1,'CS',2,'Saira Baig'),
(2,'Civil',7,'Bismillah Jan');

INSERT INTO Teacher
VALUES 
('Saira Baig','Assistant Prof.','Computer Science'),
('Bismillah Jan','Lecturer','Civil Eng.'),
('Kashif Zafar','Professor','Electrical Eng.');


SELECT * FROM Student;
SELECT * FROM Attendance;
SELECT * FROM ClassVenue;
SELECT * FROM Teacher;


----------- QUESTION 2 ------------
ALTER TABLE Student ALTER COLUMN RollNum VARCHAR(255) NOT NULL
ALTER TABLE Student ADD CONSTRAINT PK_STUDENT primary key (RollNum);

ALTER TABLE Attendance ALTER COLUMN RollNum VARCHAR(255) NOT NULL
ALTER TABLE Attendance ADD CONSTRAINT PK_ATTENDANCE primary key (RollNum);

ALTER TABLE ClassVenue ALTER COLUMN ID int NOT NULL
ALTER TABLE ClassVenue ADD CONSTRAINT PK_CLASSVENUE primary key (ID);

ALTER TABLE Teacher ALTER COLUMN Name VARCHAR(255) NOT NULL
ALTER TABLE Teacher ADD CONSTRAINT PK_TEACHER primary key (Name);


----------- QUESTION 3 ------------
ALTER TABLE Attendance ADD CONSTRAINT FK_STUDENT FOREIGN KEY (RollNum) references Student (RollNum);
ALTER TABLE Attendance ADD CONSTRAINT FK_ATTENDANCE FOREIGN KEY (ClassVenue) references ClassVenue (ID);

ALTER TABLE ClassVenue ADD CONSTRAINT FK_CLASSVENUE FOREIGN KEY (Teacher) references Teacher (Name);


----------- QUESTION 4 ------------
ALTER TABLE Student ADD WarningCount INT;
ALTER TABLE Student DROP COLUMN Phone;

----------- QUESTION 5 ------------
--Add new row into Student table, values <L162334, Fozan Shahid, Male, 3.2 >
-- i) VALID
INSERT INTO Student VALUES ('L162334', 'Fozan Shahid', 'M', 3.2);

--Add new row into ClassVenue table, values <3, CS, 5, Ali>
-- ii) INVALID - Ali doesn't exist as a teacher
INSERT INTO ClassVenue VALUES (3, 'CS', 5, 'Ali');

--Update Teacher table Change “Kashif zafar” name to “Dr. Kashif Zafar”.
-- iii) VALID
UPDATE Teacher SET Name = 'Dr. Kashif Zafar' WHERE Name = 'Kashif zafar'

--Delete Student with rollnum “L162334”
-- iv) VALID 
DELETE FROM Student WHERE RollNum = 'L162334';

--Delete Student with rollnum “L164123”
-- INVALID - Becuase this roll number is being used as a FK in Attendance
DELETE FROM Student WHERE RollNum = 'L164123';

--Delete Attendance with rollnum “L164124”, if his status is absent.
-- VALID 
DELETE FROM Attendance WHERE (RollNum = 'L164124' AND AStatus = 'A');


----------- QUESTION 6 ------------
ALTER TABLE Teacher ADD CONSTRAINT UNIQUE_CONSTRAINT_TEACHER UNIQUE (Name);
ALTER TABLE Student ADD CONSTRAINT CHECK_CONSTRAINT_GENDER CHECK (Gender='M' OR Gender='F');
ALTER TABLE Attendance ADD CONSTRAINT CHECK_CONSTRAINT_ATTENDANCE CHECK (AStatus='A' or AStatus='P');