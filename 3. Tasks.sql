USE Company;

--1.	Простейшие запросы:
--a.	Получить всё содержимое таблицы Employee;
	
	GO

	SELECT *
	FROM dbo.Employee

--b.	Получить коды и названия должностей, чья минимальная заработная плата не превышает 500;

	GO
	
	DECLARE @Salary INT = 500;

	SELECT j.Id, j.Post
	FROM dbo.Job AS j
	WHERE j.Salary < @salary

--c.	Получить среднюю заработную плату начисленную в январе 2015 года.

	GO

	DECLARE @Month TINYINT = 1;
	DECLARE @Year SMALLINT = 2015;

	SELECT AVG(s.SalaryAmount) AS [Average salary]
	FROM dbo.Salary AS s
	WHERE s.[Month] = @Month AND s.[Year] = @Year;

--2.	Вложенные подзапросы:
--a.	Получить имя самого немолодого сотрудника, а также его дату рождения;
	
	GO

	SELECT emp.Name, emp.Birthday
	FROM dbo.Employee AS emp
	WHERE emp.Birthday = (SELECT MIN(e.Birthday)
						  FROM dbo.Employee AS e);

--b.	Найти фамилии работников, которым была начислена заработная плата в январе 2015 года;

	GO

	DECLARE @Month TINYINT = 1;
	DECLARE @Year SMALLINT = 2015;

	SELECT emp.Surname
	FROM dbo.Employee AS emp
	WHERE emp.Id IN (SELECT s.IdEmployee
					FROM dbo.Salary AS s
					WHERE s.[Month] = @Month AND s.[Year] = @Year);

--c.	Найти коды работников, заработная плата которых в мае 2015 года; снизилась по сравнению с каким-либо предыдущим месяцем этого же года;

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

--d.	Получить информацию о кодах, названиях отделов и числе работающих в них в настоящее время сотрудников.

	SELECT dep.Id, dep.Name, (SELECT COUNT(*) 
							  FROM dbo.Career AS c 
							  WHERE c.IdDepartment = dep.Id) 
							  AS EmployeeCount
	FROM dbo.Department AS dep

--3.	Группировка данных:
--a.	Найти среднюю начисленную заработную плату за 2015 год в разрезе работников;

	GO

	DECLARE @Year SMALLINT = 2015;

	SELECT s.IdEmployee, AVG(s.SalaryAmount) AS [Average salary]
	FROM dbo.Salary AS s
	WHERE s.[Year] = @Year
	GROUP BY s.IdEmployee

--b.	Найти среднюю заработную плату за 2015 год в разрезе работников. Включать в результат только тех работников, начисления которым проводились не менее двух раз.

	GO

	DECLARE @Year SMALLINT = 2015;
	DECLARE @Limit TINYINT = 2;

	SELECT s.IdEmployee, AVG(s.SalaryAmount) AS [Average salary]
	FROM dbo.Salary AS s
	WHERE s.[Year] = @Year
	GROUP BY s.IdEmployee
	HAVING COUNT(*) >= @Limit

--4.	Соединения таблиц:
--a.	Найти имена тех работников, начисленная заработная плата которых за январь 2015 превысила 1000;

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

--b.	Найти имена работников и стаж их непрерывной работы (на одной должности и в одном отделе). 

	GO

	DECLARE @NowYear SMALLINT = YEAR(GETDATE());

	SELECT e.Name, (@NowYear - YEAR(c.EmploymentDate)) AS Experience
	FROM dbo.Employee AS e
		INNER JOIN dbo.Career		AS c ON e.Id = c.IdEmployee
		INNER JOIN dbo.Department	AS d ON d.Id = c.IdDepartment 
		INNER JOIN dbo.Job			AS j ON j.Id = c.IdJob;

--5.	Модификация данных:
--a.	Увеличить минимальную заработную плату для всех должностей в 1.5 раза;

	GO

	DECLARE @Coefficients FLOAT = 1.5;

	UPDATE dbo.Job
	SET Salary *= @Coefficients;

--b.	Удалить из таблицы salary все записи старше 2015 года.

	GO
	
	DECLARE @OlderYear SMALLINT = 2015

	DELETE dbo.Salary
	WHERE dbo.Salary.[Year] < @OlderYear;