GO

CREATE DATABASE Company
ON PRIMARY (NAME = Company_logic,
		       FILENAME = 'D:\artur.mezhidov@itechart-group.com\Task 6\DataBaseSQL\Company.mdf',
		       SIZE = 10 MB,
		       MAXSIZE = 1000,
		       FILEGROWTH = 5)
LOG ON (NAME = Company_log,
		    FILENAME = 'D:\artur.mezhidov@itechart-group.com\Task 6\DataBaseSQL\Company.ldf',
		    SIZE = 5 MB,
		    MAXSIZE = 1000,
		    FILEGROWTH = 5);


USE Company;
GO

CREATE TABLE Department (
	Id INT PRIMARY KEY IDENTITY (100, 1),
	Name NVARCHAR(100) NOT NULL CHECK(Name <> ''),
	[Address] NVARCHAR(100) NOT NULL CHECK([Address] <> '') 
);

CREATE TABLE Employee (
	Id INT PRIMARY KEY IDENTITY (100, 1),
	Surname NVARCHAR(50) NOT NULL CHECK(Surname <> ''),
	Name NVARCHAR(50) NOT NULL CHECK(Name <> ''),
	Birthday DATE NOT NULL CHECK(Birthday < GETDATE())
);

CREATE TABLE Job (
	Id INT PRIMARY KEY IDENTITY (100, 1),
	Post NVARCHAR(50) NOT NULL CHECK(Post <> ''),
	Salary SMALLMONEY NOT NULL CHECK(Salary > 0)
);


CREATE TABLE Career (
	Id INT PRIMARY KEY IDENTITY (100, 1),
	IdJob INT NOT NULL,
	IdEmployee INT NOT NULL,
	IdDepartment INT NOT NULL,
	EmploymentDate DATE NOT NULL,
	DismissalDate DATE NULL,

	CONSTRAINT FK_IdJob 
		FOREIGN KEY (IdJob) REFERENCES dbo.Job,

	CONSTRAINT FK_IdEmployee 
		FOREIGN KEY (IdEmployee) REFERENCES dbo.Employee,

	CONSTRAINT FK_IdDepartment
		FOREIGN KEY (IdDepartment) REFERENCES dbo.Department
);

CREATE TABLE Salary (
	Id INT PRIMARY KEY IDENTITY (100, 1),
	IdEmployee INT NOT NULL,
	[Month] TINYINT NOT NULL CHECK([Month] BETWEEN 1 AND 12),
	[Year] SMALLINT NOT NULL CHECK([Year] BETWEEN 2002 AND 2016),
	SalaryAmount MONEY NOT NULL CHECK(SalaryAmount >= 0),

	CONSTRAINT FK_IdEmployee_Salary
		FOREIGN KEY (IdEmployee) REFERENCES dbo.Employee
);