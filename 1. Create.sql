GO
CREATE DATABASE Company;

USE Company;
GO

CREATE TABLE Departments (
	Id INT PRIMARY KEY IDENTITY (1, 1),
	Name NVARCHAR(256) NOT NULL CHECK(Name <> ''),
	[Address] NVARCHAR(256) NOT NULL CHECK([Address] <> '')
);

CREATE TABLE Employees (
	Id INT PRIMARY KEY IDENTITY (1, 1),
	LastName NVARCHAR(256) NOT NULL CHECK(LastName <> ''),
	FirstName NVARCHAR(256) NOT NULL CHECK(FirstName <> ''),
	Birthday DATE NOT NULL CHECK(Birthday < GETDATE())
);

CREATE TABLE Jobs (
	Id INT PRIMARY KEY IDENTITY (1, 1),
	Name NVARCHAR(256) NOT NULL CHECK(Name <> ''),
	Salary MONEY NOT NULL CHECK(Salary > 0)
);

CREATE TABLE Careers (
	Id INT PRIMARY KEY IDENTITY (1, 1),
	JobId INT NOT NULL,
	EmployeeId INT NOT NULL,
	DepartmentId INT NOT NULL,
	EmploymentDate DATE NOT NULL,
	DismissalDate DATE NULL,

	CONSTRAINT FK_IdJob 
		FOREIGN KEY (JobId) REFERENCES dbo.Jobs,

	CONSTRAINT FK_IdEmployee 
		FOREIGN KEY (EmployeeId) REFERENCES dbo.Employees,

	CONSTRAINT FK_IdDepartment
		FOREIGN KEY (DepartmentId) REFERENCES dbo.Departments
);

CREATE TABLE Salaries (
	Id INT PRIMARY KEY IDENTITY (1, 1),
	EmployeeId INT NOT NULL,
	[Month] TINYINT NOT NULL CHECK([Month] BETWEEN 1 AND 12),
	[Year] SMALLINT NOT NULL CHECK([Year] BETWEEN 2002 AND 2016),
	SalaryAmount MONEY NOT NULL CHECK(SalaryAmount >= 0),

	CONSTRAINT FK_IdEmployee_Salary
		FOREIGN KEY (EmployeeId) REFERENCES dbo.Employees
);