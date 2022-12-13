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