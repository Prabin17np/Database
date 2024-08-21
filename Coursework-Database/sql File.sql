create database task;
use task;

create table address(
	AddressId varchar(255) not null primary key,
    Address varchar(255) not null
);

create table guardain(
	GuardainId varchar(255) not null primary key,
    Name varchar(255) not null,
    Phone varchar(20) not null
);

create table student(
	StudentId varchar(255) not null primary key,
    AddressId varchar(255),
    GuardainId varchar(255) ,
    Name varchar(155) not null,
    Gender varchar(50) not null,
    DOB varchar(20) not null,
    Foreign KEY(AddressId) references address(AddressId),
    Foreign KEY(GuardainId) references guardain(GuardainId)
);

create table fees(
	FeeId varchar(255) not null primary key,
    Class varchar(50) not null,
    Amount int not null
);

create table payment(
	PaymentId varchar(255) not null primary key,
    FeeId varchar(255) not null,
    StudentId varchar(255) not null,
    Date varchar(20) not null,
    Foreign KEY(FeeId) references fees(FeeId),
    Foreign KEY(StudentId) references student(StudentId)
);
create table subjects(
	SubjectId varchar(255) not null primary key,
    Subject varchar(50) not null,
    Class varchar(50) not null
);
create table teacher(
	TeacherId varchar(255) not null primary key,
    AddressId varchar(255) not null,
    Name varchar(155) not null,
    Gender varchar(50) not null,
    Salary int not null,
    Phone varchar(20) not null,
    DOB varchar(20) not null,
    Foreign KEY(AddressId) references address(AddressId)
);

create table attendance(
	AttendanceId varchar(255) not null primary key,
    StudentId varchar(255) not null,
    Date varchar(20) not null,
    Status varchar(20) not null,
    Foreign KEY(StudentId) references student(StudentId)
);
create table result(
	ResultId varchar(255) not null primary key,
    StudentId varchar(255) not null,
    Exam_Date varchar(20) not null,
    SubjectId varchar(255) not null,
    Score int not null,
    Foreign KEY(StudentId) references student(StudentId),
    Foreign KEY(SubjectId) references subjects(Subjectid)
);
create table location(
	LocationId varchar(255) not null primary key,
    Location varchar(255) not null
);
create table event(
	EventId varchar(255) not null primary key,
    LocationId varchar(255) not null,
    Date varchar(20) not null,
    Name varchar(255) not null,
    Foreign KEY(LocationId) references location(LocationId)
);
create table book(
	BookId varchar(255) not null primary key,
    Author varchar(255) not null,
    Name varchar(255) not null);

create table library_records(
	LibraryRecordsId varchar(255) not null primary key,
    StudentId varchar(255) not null,
    BookId varchar(255) not null,
    IssueDate varchar(20) not null,
    RetuenDate varchar(20) not null,
    Foreign KEY(StudentId) references student(StudentId),
    Foreign KEY(BookId) references book(BookId)
);

insert into address values
("A101",	"Tansen-8, Palpa, Lumbini"),
("A102",	"Bhairava-1, Rupendehi, Lumbini"),
("A103",	"Butwal-12, Rupendehi, Lumbini"),
("A104",	"Tansen-8, Palpa, Lumbini"),
("A105",	"Butwal-10, Rupandehi, Lumbini"),
("A106",	"Taulihawa-5, Kapilvastu, Lumbini"),
("A107",	"Siddharthanagar-12, Lumbini")
;
insert into teacher values("T100", "A101", "Ashok Aryal","Male",40000,"9867389098", "9/5/1980"),
("T101", "A102",	"Basanta Poudel","Male",45000,"9876787887", "4/25/1975"),
("T102", "A103","Lekhnath Panta","Male", 60000,	"9856788993", "1/28/1985"),
("T103","A103",	"Roman Sherstha","Male",55000,"9843678567", "6/2/1990"),
("T104", "A104","Ritika Banjade","Female",50000,"9841678939", "5/11/1992")
;

insert into guardain values("G101",	"Gita Acharya",	"9847011111"),
("G102"	,"Ram Sharma"	,"9816412121"),
("G103",	"Hari Rai",	"9867066700")
;
insert into student values
("S100", "A105",	"G101",	"Rajesh Acharya","Male","3/15/2005"),		
("S101","A106",	"G102","Sita Sharma","Female","6/20/2006"),
("S102",	"A107",	"G103",	"Asha Rai","Female", "11/10/2004"	),
("S103", null, null,	"Asha Sharma",	"Female","0/0/0"),
("S104", null, null,	"Rajesh rai",	"Male","0/0/0")
;
insert into attendance values("A101",	"S100",	"7/1/2023","Present"),
("A102",	"S101",	"7/2/2023",	"Absent"),
("A103",	"S102",	"7/3/2023",	"Present"),
("A104",	"S104",	"7/1/2023",	"Present"),
("A105",	"S101",	"7/2/2023",	"Present"),
("A106",	"S102",	"7/3/2023",	"Absent");

insert into fees values
("F100","Nursery",1500),
("F101","KG",1500),
("F102","1",2000),
("F103","2",2500),
("F104","3",3000),
("F105","4",3500),
("F106","5",4000),
("F107","6",4500),
("F108","7",5000),
("F109","8",5500),
("F110","9",6000),
("F111","10",6500)
;

insert into payment values
("P101","F108",	"S101",		"4/10/2080"),
("P102", "F110","S102",		"4/10/2080"),
("P103","F108",	"S103",		"4/5/2080")
;
insert into subjects values
("S100",	"Mathematics",	10),
("S101",	"Science",	10),
("S102",	"English",	9),
("S103",	"Social Studies",	9),
("S104",	"Nepali",	0),
("S105",	"Sanskrit",	0)
;

insert into result values
("R101",	"S100",	"6/15/2023",	"S100",	85),
("R102"	,"S101",	"6/20/2023",	"S101",	92),
("R103",	"S102",	"6/25/2023",	"S104",	78),
("R104",	"S101",	"6/15/2023",	"S105",	78),
("R105",	"S103",	"6/20/2023",	"S102",	90),
("R106",	"S103",	"6/25/2023",	"S100",	65)
;

insert into book values
("B100", "Herbert Schildt",	"Java the complete reference (12th edition)"),
("B101",	"Tara Calishain", "Spidering HACKS"),
("B102"	, "Johnson M. Hart","Windows System Programming"),
("B103","Jon Skeet","C# in Depth")
;

insert into library_records values
("LR100",	"S102",	"B100",	"7/5/2023"	,"7/20/2023"),
("LR101",	"S101",	"B101",	"6/30/2023",	"7/10/2023"),
("LR102"	,"S103",	"B102",	"7/10/2023",	"7/25/2023"),
("LR103",	"S103",	"B103",	"7/15/2023",	"7/25/2023")
;

insert into location values
("L100",	"School Grounds"),
("L101",	"Sports Complex"),
("L102",	"Science Lab"),
("L103",	"School Auditorium")
;

insert into event values
("E100","L100","8/10/2023","Annual Day"	),
("E101","L101","9/20/2023","Sports Day"),
("E102","L102","10/15/2023","Science Fair"),
("E103","L103","7/30/2023","Parent-Teacher Meeting");

select * from fees;
select * from payment;
select * from subjects;
select * from student;
select * from attendance;
select * from result;
select * from address;
select * from teacher;
select * from location;
select * from event;
ALTER TABLE event
MODIFY COLUMN Date VARCHAR(20);
UPDATE fees
SET Amount = ROUND(Amount * 1.20);

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Attendance
WHERE StudentID IN (
    SELECT StudentID
    FROM (
        SELECT StudentID, 
               COUNT(*) AS AbsentDays,
               MIN(STR_TO_DATE(Date, '%m/%d/%Y')) AS StartDate,
               MAX(STR_TO_DATE(Date, '%m/%d/%Y')) AS EndDate
        FROM Attendance
        WHERE Status = 'Absent' 
          AND MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) = MONTH(CURRENT_DATE) 
          AND YEAR(STR_TO_DATE(Date, '%m/%d/%Y')) = YEAR(CURRENT_DATE)
        GROUP BY StudentID
        HAVING COUNT(*) > 10
          AND DATEDIFF(MAX(STR_TO_DATE(Date, '%m/%d/%Y')), MIN(STR_TO_DATE(Date, '%m/%d/%Y'))) + 1 = COUNT(*)
    ) AS SubQuery
);
SET SQL_SAFE_UPDATES = 0;

INSERT INTO guardain (GuardainId, Name, Phone) VALUES ('G120', 'Ram', '9876543210');

INSERT INTO student (StudentId, AddressId, GuardainId, Name, Gender, DOB)
VALUES ('S100', 'A101', 'G120', 'Shyam', 'Female', '2010-08-15');
    
SELECT 
    s.StudentId,
    s.Name AS StudentName,
    sb.Subject AS SubjectName,
    r.Score AS TotalMarks,
    (r.Score / 100) * 100 AS SubjectPercentage,
    (SUM(r.Score) OVER (PARTITION BY s.StudentId) / (COUNT(sb.SubjectId) OVER (PARTITION BY s.StudentId) * 100)) * 100 
    AS OverallPercentage
FROM 
    result r
JOIN 
    student s ON r.StudentId = s.StudentId
JOIN
    subjects sb ON r.SubjectId = sb.SubjectId
ORDER BY 
    s.StudentId, sb.SubjectId;

UPDATE result
SET Score = ROUND(Score * 0.90);

UPDATE result
SET Score = Score * 1.10;

SELECT 
    s.Name AS StudentName,
    r.Exam_Date AS ExamDate,
    r.Score,
    sb.Subject AS SubjectName,
    g.Name AS GuardianName
FROM 
    student s JOIN 
    result r ON s.StudentId = r.StudentId
JOIN 
    subjects sb ON r.SubjectId = sb.SubjectId
JOIN 
    guardain g ON s.GuardainId = g.GuardainId
WHERE 
    r.Score > 70
ORDER BY 
    s.Name, r.Exam_Date;

