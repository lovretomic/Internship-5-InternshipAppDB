CREATE TABLE Members(
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Pin VARCHAR(11) NOT NULL,
	DateOfBirth TIMESTAMP NOT NULL,
	Gender VARCHAR(1) NOT NULL, --M/F
	CityOfResidence VARCHAR(30) NOT NULL
)

CREATE TABLE Students(
	Id SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Pin VARCHAR(11) NOT NULL,
	DateOfBirth TIMESTAMP NOT NULL,
	Gender VARCHAR(1) NOT NULL, --M/F
	CityOfResidence VARCHAR(30) NOT NULL
)

CREATE TABLE Internships(
	Id SERIAL PRIMARY KEY,
	StartDate TIMESTAMP NOT NULL,
	EndDate TIMESTAMP NOT NULL,
	Phase VARCHAR(30),
	Director INT REFERENCES Members(Id)
)

CREATE TABLE Areas(
	Id SERIAL PRIMARY KEY,
	Title VARCHAR(30) NOT NULL,
	Director INT REFERENCES Members(Id)
)

CREATE TABLE Homeworks (
	Id SERIAL PRIMARY KEY,
	Title VARCHAR(30) NOT NULL,
	AreaId INT REFERENCES Areas(Id)
)

-- STEP 1 -- PRIMARY TABLES

INSERT INTO Members(Name, Pin, DateOfBirth, Gender, CityOfResidence) VALUES
('Alex Amanzi', '12345678910', '2000-10-10', 'M', 'Split'),
('Duje Saric', '56371957156', '1998-03-2', 'M', 'Split'),
('Marija Sustic', '67105738067', '2001-11-09', 'F', 'Split'),
('Bartol Deak', '82902367898', '2002-04-17', 'M', 'Split'),
('Lucia Vukorepa', '67810395712', '1999-02-10', 'M', 'Split'),
('Nino Borovic', '12345678910', '2002-06-11', 'M', 'Split'),
('Gabriela Bonic', '86912057812', '2003-09-29', 'F', 'Split'),
('Ante Roca', '87913475869', '2003-03-10', 'M', 'Makarska'),
('Matija Luketin', '09275647182', '2001-08-07', 'M', 'Solin'),
('Ivo Ivic', '85940301935', '1990-08-07', 'M', 'Solin')

INSERT INTO Areas(Title, Director) VALUES
('Programiranje', 5),
('Dizajn', 1),
('Multimedija', 7),
('Marketing', 6)

INSERT INTO Homeworks(Title, AreaId) VALUES
('Dev 1 Git',1),
('Dev 2 CSharp',1),
('Dev 3 OOP Calendar',1),
('Dev 4 Crypto wallet',1),
('Diz 1 Logo',2),
('Diz 2 UI',2),
('Diz 3 UX',2),
('Diz 4 Illustrator',2),
('Mul 1 Uvod',3),
('Mul 2 Photoshop',3),
('Mul 3 Fotografije',3),
('Mul 4 Portreti',3),
('Mar 1 DR1',4),
('Mar 2 DR2',4),
('Mar 3 DR3',4),
('Mar 4 DR4',4)

INSERT INTO Internships(StartDate, EndDate, Phase, Director) VALUES
('2018-11-02', '2019-05-01', 'ENDED', 3),
('2019-11-02', '2020-05-01', 'ENDED', 1),
('2020-11-02', '2021-05-01', 'ENDED', 4),
('2021-11-02', '2022-05-01', 'ENDED', 5),
('2022-11-02', '2023-05-01', 'IN PROGRESS', 6),
('2022-11-02', '2023-05-01', 'PREPARING', 2)

INSERT INTO Students(Name, Pin, DateOfBirth, Gender, CityOfResidence) VALUES
('Valerija Jurić', '46106084094', '1998-08-02', 'F', 'Split'),
('Branko Lučić', '42512853879', '1998-09-28', 'M', 'Split'),
('Fabijan Perić', '16320072873', '1999-08-11', 'M', 'Split'),
('Zvonimira Vlahović', '06359926554', '1999-09-03', 'F', 'Solin'),
('Julijana Marković', '47458894327', '1999-10-15', 'F', 'Kaštela'),
('Darinka Košar', '96585108399', '1999-12-05', 'F', 'Kaštela'),
('Snježana Marić', '24278009603', '2000-03-29', 'F', 'Split'),
('Klara Lončar', '58839273314', '2000-06-21', 'F', 'Kaštela'),
('Blago Marić', '73302828640', '2001-04-17', 'M', 'Trogir'),
('Edita Juriša', '34997480714', '2001-11-18', 'F', 'Split'),
('Josip Kolar', '20101336154', '2004-02-21', 'M', 'Split'),
('Vid Kovač', '81862916907', '2004-04-18', 'M', 'Split'),
('Sanda Petrić', '12412829384', '2004-04-28', 'F', 'Kaštela'),
('Branimir Martinović', '51741564864', '2004-05-29', 'M', 'Sinj'),
('Vanja Pavić', '20463483563', '2004-07-09', 'F', 'Split'),
('Franjo Perko', '81884423999', '2004-08-17', 'M', 'Makarska'),
('Marina Medved', '62596552438', '2004-09-30', 'F', 'Split'),
('Damir Nikolić', '01221562998', '2005-01-19', 'M', 'Trogir'),
('Matija Ilić', '36429866508', '2005-03-25', 'M', 'Split'),
('Krešo Kolarić', '58635072591', '2005-11-16', 'M', 'Split')

-- STEP 2 -- TEST CASES FOR PRIMARY TABLES

CREATE TABLE StudentHomeworks (
	StudentId INT REFERENCES Students(Id),
	HomeworkId INT REFERENCES Homeworks(Id),
	Grade INT,
	PRIMARY KEY(StudentId, HomeworkId)
)

CREATE TABLE StudentAreas (
	StudentId INT REFERENCES Students(Id),
	AreaId INT REFERENCES Areas(Id),
	Status VARCHAR(30),
	PRIMARY KEY(StudentId, AreaId)
)

CREATE TABLE InternshipAreas (
	InternshipId INT REFERENCES Internships(Id),
	AreaId INT REFERENCES Areas(Id),
	PRIMARY KEY(InternshipId, AreaId)
)

-- STEP 3 -- JUNCTION TABLES

INSERT INTO StudentHomeworks(StudentId, HomeworkId, Grade) VALUES
(1, 1, 1), (1, 2, 5), (1, 3, 3), (1, 4, 3),
(2, 1, 2), (2, 2, 4), (2, 3, 2), (2, 4, 4),
(3, 1, 3), (3, 2, 3), (3, 3, 1), (3, 4, 5),
(4, 1, 4), (4, 2, 2), (4, 3, 5), (4, 4, 1),
(5, 1, 5), (5, 2, 1), (5, 3, 4), (5, 4, 2),
(6, 1, 1), (6, 2, 5), (6, 3, 3), (6, 4, 3),
(7, 1, 2), (7, 2, 4), (7, 3, 2), (7, 4, 4),
(8, 1, 3), (8, 2, 3), (8, 3, 1), (8, 4, 5),
(9, 1, 4), (9, 2, 2), (9, 3, 5), (9, 4, 1),
(10, 1, 5), (10, 2, 1), (10, 3, 4), (10, 4, 2),

(11, 5, 2), (11, 6, 1), (11, 7, 4), (11, 8, 2),
(12, 5, 3), (12, 6, 2), (12, 7, 5), (12, 8, 3),
(13, 5, 5), (13, 6, 3), (13, 7, 1), (13, 8, 4),

(14, 9, 5), (14, 10, 4), (14, 11, 3), (14, 12, 2),
(15, 9, 1), (15, 10, 5), (15, 11, 4), (15, 12, 3),
(16, 9, 2), (16, 10, 1), (16, 11, 5), (16, 12, 4),
(17, 9, 3), (17, 10, 2), (17, 11, 1), (17, 12, 5),

(18, 13, 1), (18, 14, 4), (18, 15, 2), (18, 16, 5),
(19, 13, 2), (19, 14, 5), (19, 15, 3), (19, 16, 1),
(20, 13, 3), (20, 14, 1), (20, 15, 4), (20, 16, 2)

INSERT INTO StudentAreas(StudentId, AreaId, Status) VALUES
(1,1,'PRIPRAVNIK'),
(2,1,'PRIPRAVNIK'),
(3,1,'PRIPRAVNIK'),
(4,1,'PRIPRAVNIK'),
(5,1,'PRIPRAVNIK'),
(6,1,'PRIPRAVNIK'),
(7,1,'IZBACEN'),
(8,1,'PRIPRAVNIK'),
(9,1,'ZAVRSEN'),
(10,1,'PRIPRAVNIK'),
(11,2,'PRIPRAVNIK'),
(12,2,'PRIPRAVNIK'),
(13,2,'IZBACEN'),
(14,3,'PRIPRAVNIK'),
(15,3,'PRIPRAVNIK'),
(16,3,'PRIPRAVNIK'),
(17,3,'IZBACEN'),
(18,4,'IZBACEN'),
(19,4,'IZBACEN'),
(20,4,'PRIPRAVNIK')

INSERT INTO InternshipAreas(InternshipId, AreaId) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),

(2, 1),
(2, 2),
(2, 3),
(2, 4),

(3, 1),
(3, 2),
(3, 3),
(3, 4),

(4, 1),
(4, 2),
(4, 3),
(4, 4),

(5, 1),
(5, 2),
(5, 3),
(5, 4),

(6, 1),
(6, 2),
(6, 3),
(6, 4)

-- STEP 4 -- JUNCTION TABLES TEST CASES


ALTER TABLE Students 
	ADD CONSTRAINT AgeLimit CHECK
	(DATE_PART('year', NOW()) - DATE_PART('year', DateOfBirth) >= 16 AND
	 DATE_PART('year', NOW()) - DATE_PART('year', DateOfBirth) <= 24)

-- Iduci blok : SELECT dohvaca informacije o broju polaznika,
-- ali nisam nasao rjesenje kako to implementirati u constraint
ALTER TABLE StudentAreas
	ADD CONSTRAINT CountLimit CHECK
	(COUNT(
		SELECT sa.AreaId, COUNT(sa.StudentId) FROM StudentAreas sa
		GROUP BY sa.AreaId)
	 < 20)
	 

-- STEP 5 -- UPDATE CONSTRAINTS

SELECT m.Name FROM Members m WHERE m.CityOfResidence != 'Split'

SELECT i.StartDate, i.EndDate FROM Internships i ORDER BY i.StartDate DESC

SELECT DISTINCT s.Name FROM Students s
	JOIN StudentAreas sa ON s.Id = sa.StudentId
	JOIN InternshipAreas ia ON ia.AreaId = sa.AreaId
	JOIN Internships i ON i.Id = ia.InternshipId
	WHERE DATE_PART('year',i.StartDate) = 2022
	
SELECT DISTINCT s.Name FROM Students s
	JOIN StudentAreas sa ON s.Id = sa.StudentId
	JOIN InternshipAreas ia ON ia.AreaId = sa.AreaId
	JOIN Internships i ON i.Id = ia.InternshipId
	JOIN Areas a ON a.Id = ia.AreaId
	WHERE DATE_PART('year',i.StartDate) = 2022 AND s.Gender = 'F' AND a.Title = 'Programiranje'

SELECT DISTINCT s.Name FROM Students s
	JOIN StudentAreas sa ON s.Id = sa.StudentId
	JOIN InternshipAreas ia ON ia.AreaId = sa.AreaId
	JOIN Internships i ON i.Id = ia.InternshipId
	JOIN Areas a ON a.Id = ia.AreaId
	WHERE s.Gender = 'M' AND a.Title = 'Marketing' AND sa.Status = 'IZBACEN'

UPDATE Members
	SET CityOfResidence = 'Moskva'
	WHERE RIGHT(Name, 2) = 'in'

SELECT m.Name, m.DateOfBirth, DATE_PART('year', NOW()) - DATE_PART('year', m.DateOfBirth) AS Age FROM Members m
	WHERE DATE_PART('year', NOW()) - DATE_PART('year', m.DateOfBirth) > 25

-- Iduci blok dohvaca potrebne podatke, ali nisam pronasao rjesenje
-- kako te podatke izbrisati
SELECT s.Name, ROUND(AVG(sh.Grade), 2) AS AverageGrade FROM Students s 
	JOIN StudentHomeworks sh ON sh.StudentId = s.Id
	JOIN Homeworks h ON sh.HomeworkId = h.Id
	GROUP BY s.Name
	HAVING ROUND(AVG(sh.Grade), 2) < 2.4

-- STEP 6 -- TASKS