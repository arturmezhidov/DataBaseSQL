USE Company;

--1.	���������� �������:
--a.	�������� �� ���������� ������� Employee;
	
	GO

	SELECT *
	FROM dbo.Employee

--b.	�������� ���� � �������� ����������, ��� ����������� ���������� ����� �� ��������� 500;

	GO
	
	DECLARE @Salary INT = 500;

	SELECT j.Id, j.Post
	FROM dbo.Job AS j
	WHERE j.Salary < @salary

--c.	�������� ������� ���������� ����� ����������� � ������ 2015 ����.

	GO

	DECLARE @Month TINYINT = 1;
	DECLARE @Year SMALLINT = 2015;

	SELECT AVG(s.SalaryAmount) AS [Average salary]
	FROM dbo.Salary AS s
	WHERE s.[Month] = @Month AND s.[Year] = @Year;

--2.	��������� ����������:
--a.	�������� ��� ������ ���������� ����������, � ����� ��� ���� ��������;
	
	GO

	SELECT emp.Name, emp.Birthday
	FROM dbo.Employee AS emp
	WHERE emp.Birthday = (SELECT MIN(e.Birthday)
						  FROM dbo.Employee AS e);

--b.	����� ������� ����������, ������� ���� ��������� ���������� ����� � ������ 2015 ����;

	GO

	DECLARE @Month TINYINT = 1;
	DECLARE @Year SMALLINT = 2015;

	SELECT emp.Surname
	FROM dbo.Employee AS emp
	WHERE emp.Id IN (SELECT s.IdEmployee
					FROM dbo.Salary AS s
					WHERE s.[Month] = @Month AND s.[Year] = @Year);

--c.	����� ���� ����������, ���������� ����� ������� � ��� 2015 ����; ��������� �� ��������� � �����-���� ���������� ������� ����� �� ����;

	GO

	DECLARE @Month TINYINT = 5;
	DECLARE @Year SMALLINT = 2015;

	SELECT sal.IdEmployee
	FROM dbo.Salary AS sal
	WHERE sal.[Month] = @Month AND 
		  sal.[Year] = @Year AND
		  sal.SalaryAmount < (SELECT MAX(s.SalaryAmount)
							  FROM dbo.Salary AS s
							  WHERE s.IdEmployee = sal.IdEmployee AND
									s.[Month] < @Month AND 
									s.[Year] = @Year);

--d.	�������� ���������� � �����, ��������� ������� � ����� ���������� � ��� � ��������� ����� �����������.

	SELECT dep.Id, dep.Name, (SELECT COUNT(*) 
							  FROM dbo.Career AS c 
							  WHERE c.IdDepartment = dep.Id) 
							  AS EmployeeCount
	FROM dbo.Department AS dep

--3.	����������� ������:
--a.	����� ������� ����������� ���������� ����� �� 2015 ��� � ������� ����������;

	GO

	DECLARE @Year SMALLINT = 2015;

	SELECT s.IdEmployee, AVG(s.SalaryAmount) AS [Average salary]
	FROM dbo.Salary AS s
	WHERE s.[Year] = @Year
	GROUP BY s.IdEmployee

--b.	����� ������� ���������� ����� �� 2015 ��� � ������� ����������. �������� � ��������� ������ ��� ����������, ���������� ������� ����������� �� ����� ���� ���.

	GO

	DECLARE @Year SMALLINT = 2015;
	DECLARE @Limit TINYINT = 2;

	SELECT s.IdEmployee, AVG(s.SalaryAmount) AS [Average salary]
	FROM dbo.Salary AS s
	WHERE s.[Year] = @Year
	GROUP BY s.IdEmployee
	HAVING COUNT(*) >= @Limit

--4.	���������� ������:
--a.	����� ����� ��� ����������, ����������� ���������� ����� ������� �� ������ 2015 ��������� 1000;

	GO
	
	DECLARE @Month TINYINT = 1;
	DECLARE @Year SMALLINT = 2015;
	DECLARE @Salary MONEY = 1000;

	SELECT emp.Name
	FROM dbo.Employee AS emp
		INNER JOIN dbo.Salary AS sal ON sal.IdEmployee = emp.Id
	WHERE	sal.[Month] = @Month AND 
			sal.[Year] = @Year AND 
			sal.SalaryAmount > @Salary;

--b.	����� ����� ���������� � ���� �� ����������� ������ (�� ����� ��������� � � ����� ������). 

	GO

	DECLARE @NowYear SMALLINT = YEAR(GETDATE());

	SELECT e.Name, (@NowYear - YEAR(c.EmploymentDate)) AS Experience
	FROM dbo.Employee AS e
		INNER JOIN dbo.Career		AS c ON e.Id = c.IdEmployee
		INNER JOIN dbo.Department	AS d ON d.Id = c.IdDepartment 
		INNER JOIN dbo.Job			AS j ON j.Id = c.IdJob;

--5.	����������� ������:
--a.	��������� ����������� ���������� ����� ��� ���� ���������� � 1.5 ����;

	GO

	DECLARE @Coefficients FLOAT = 1.5;

	UPDATE dbo.Job
	SET Salary *= @Coefficients;

--b.	������� �� ������� salary ��� ������ ������ 2015 ����.

	GO
	
	DECLARE @OlderYear SMALLINT = 2015

	DELETE dbo.Salary
	WHERE dbo.Salary.[Year] < @OlderYear;