USE master 
go
IF(DB_ID('Exam10test') IS NOT NULL)
 DROP DATABASE Exam10Test
 ELSE
 CREATE DATABASE Exam10test
 go
 USE Exam10Test
 go
 create table classes
 (
   classesID int IDENTITY,
   className nvarchar(10),
   CONSTRAINT Pk_Classes PRIMARY KEY(ClassID),
   CONSTRAINT UQ_ClassesClassname unique (classname)
   )
   create table Students
   (
   RollNo varchar(6) CONTRAINT pk_Students PRIMARY KEY,
   Fullname nvarchar(50) not null,
   email varchar(10) constraint Fk_students_classes foreign key references classes(Classname) on update cascade
   )
   go 
   create index ix_email on student (email)
    create table  Subjects
	(
	sbjectID int,
	subjectName nvarchar(100)
	)
	  CREATE CLUSTERED INDEX IX_SubjectID
	  ON subjects(SubjectID)

	  CREATE NONCLUSTERED INDEX IX_SUbjectName 
	  ON Subjects(subjectName)
	  create unique index ix_UQ_SubjectName ON Subjects(SubjectName)

	  create index IX_Name_Email ON Students (fullName , Email)
	  Go

	  DROP INDEX IX_SubjectID ON  subjects
	  go

	  create clustered index IX_SubjectID ON Subjects(SubjectID)With(PAD_INDEX=ON, FILLFACTOR =60)
	  GO

	  EXEC sp_helpindex 'subject'
	  EXECUTE sp_helpindex 'Subjects'
	  GO

	  alter index IX_SubjectName ON Subjects REBUILD
	  alter index IX_SubjectName ON Subjects REBUILD WITH(FILLFACTOR=60)

	  alter index IX_SubjectName ON Subjects DISABLE 

	  alter index IX_SubjectName ON subjects rebuild

	  alter index IX_SubjectName ON Subjects REORGANIZE

	  alter index IX_SubjectName ON Subjects REBUILD WITH(ONLINE=ON)

	  alter index IX_SubjectName ON Subjects REBUILD WITH(MAXDROP=4)

	  CREATE INDEX IX_FullName _Include ON Students(FULLNAme) INclude(Email, ClassName )

	  SELECT fullname, email, classname from students where fullname LIKE '%a%'
	    drop index IX_FullName _Include ON Students
	   create  ststistics subjects Statictics_subjects

	   DBCC SHOW_STATISTICS(Subjects, Statictics_Subjects)