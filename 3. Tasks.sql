USE Company;

--1.	Простейшие запросы:
--a.	Получить всё содержимое таблицы Employee;
	
	GO

	SELECT *
	FROM dbo.Employees

--b.	Получить коды и названия должностей, чья минимальная заработная плата не превышает 500;

	GO
	
	DECLARE @Salary INT = 500;

	SELECT job.Id, job.Name
	FROM dbo.Jobs AS job
	WHERE job.Salary < @salary

--c.	Получить среднюю заработную плату начисленную в январе 2015 года.

	GO

	DECLARE @Month TINYINT = 1;
	DECLARE @Year SMALLINT = 2015;

	SELECT AVG(salary.SalaryAmount) AS [Average salary]
	FROM dbo.Salaries AS salary
	WHERE salary.[Month] = @Month AND salary.[Year] = @Year;

--2.	Вложенные подзапросы:
--a.	Получить имя самого немолодого сотрудника, а также его дату рождения;
	
	GO

	SELECT employee.FirstName, employee.Birthday
	FROM dbo.Employees AS employee
	WHERE employee.Birthday = (SELECT MIN(emp.Birthday)
								FROM dbo.Employees AS emp);

--b.	Найти фамилии работников, которым была начислена заработная плата в январе 2015 года;

	GO

	DECLARE @Month TINYINT = 1;
	DECLARE @Year SMALLINT = 2015;

	SELECT employee.LastName
	FROM dbo.Employees AS employee
	WHERE employee.Id IN (SELECT salary.EmployeeId
						  FROM dbo.Salaries AS salary
						  WHERE salary.[Month] = @Month AND salary.[Year] = @Year);

--c.	Найти коды работников, заработная плата которых в мае 2015 года; снизилась по сравнению с каким-либо предыдущим месяцем этого же года;

	GO

	DECLARE @Month TINYINT = 5;
	DECLARE @Year SMALLINT = 2015;

	SELECT sallary.EmployeeId
	FROM dbo.Salaries AS sallary
	WHERE sallary.[Month] = @Month AND 
		  sallary.[Year] = @Year AND
		  sallary.SalaryAmount < (SELECT MAX(sal.SalaryAmount)
								  FROM dbo.Salaries AS sal
								  WHERE sal.EmployeeId = sallary.EmployeeId AND
										sal.[Month] < @Month AND 
										sal.[Year] = @Year);

--d.	Получить информацию о кодах, названиях отделов и числе работающих в них в настоящее время сотрудников.

	SELECT department.Id, department.Name, (SELECT COUNT(*) 
											FROM dbo.Careers AS career
											WHERE career.DepartmentId = department.Id) 
											AS EmployeeCount
	FROM dbo.Departments AS department

--3.	Группировка данных:
--a.	Найти среднюю начисленную заработную плату за 2015 год в разрезе работников;

	GO

	DECLARE @Year SMALLINT = 2015;

	SELECT salary.EmployeeId, AVG(salary.SalaryAmount) AS [Average salary]
	FROM dbo.Salaries AS salary
	WHERE salary.[Year] = @Year
	GROUP BY salary.EmployeeId

--b.	Найти среднюю заработную плату за 2015 год в разрезе работников. Включать в результат только тех работников, начисления которым проводились не менее двух раз.

	GO

	DECLARE @Year SMALLINT = 2015;
	DECLARE @Limit TINYINT = 2;

	SELECT salary.EmployeeId, AVG(salary.SalaryAmount) AS [Average salary]
	FROM dbo.Salaries AS salary
	WHERE salary.[Year] = @Year
	GROUP BY salary.EmployeeId
	HAVING COUNT(*) >= @Limit

--4.	Соединения таблиц:
--a.	Найти имена тех работников, начисленная заработная плата которых за январь 2015 превысила 1000;

	GO
	
	DECLARE @Month TINYINT = 1;
	DECLARE @Year SMALLINT = 2015;
	DECLARE @Salary MONEY = 1000;

	SELECT employee.FirstName
	FROM dbo.Employees AS employee
		INNER JOIN dbo.Salaries AS salary ON salary.EmployeeId = employee.Id
	WHERE	salary.[Month] = @Month AND 
			salary.[Year] = @Year AND 
			salary.SalaryAmount > @Salary;

--b.	Найти имена работников и стаж их непрерывной работы (на одной должности и в одном отделе). 

	GO

	SELECT	employee.id, 
			employee.FirstName, 
			employee.LastName, 
			department.Name AS Department, 
			job.Name AS Job, 
			(YEAR(ISNULL(career.DismissalDate, GETDATE())) - YEAR(career.EmploymentDate)) AS Experience,
			career.EmploymentDate,
			career.DismissalDate
	
	FROM dbo.Employees AS employee
		INNER JOIN dbo.Careers		AS career		ON employee.Id = career.EmployeeId
		INNER JOIN dbo.Departments	AS department	ON department.Id = career.DepartmentId 
		INNER JOIN dbo.Jobs			AS job			ON job.Id = career.JobId
	ORDER BY employee.Id, career.EmploymentDate ASC;

--5.	Модификация данных:
--a.	Увеличить минимальную заработную плату для всех должностей в 1.5 раза;

	GO

	DECLARE @Coefficients FLOAT = 1.5;

	UPDATE dbo.Jobs
	SET Salary *= @Coefficients;

--b.	Удалить из таблицы salary все записи старше 2015 года.

	GO
	
	DECLARE @OlderYear SMALLINT = 2015

	DELETE dbo.Salaries
	WHERE dbo.Salaries.[Year] < @OlderYear;