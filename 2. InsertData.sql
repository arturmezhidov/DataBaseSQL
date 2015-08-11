USE Company;
GO

INSERT INTO dbo.Department(Name, [Address]) VALUES
	('APS', '��. ����������, 12'),
	('Wargaming.net / C��� ���� �����', '��. �����������, 19'),
	('�������', '��. ������, 15'),
	('�������', '��. ��������, 4'),
	('��������������� ����� �����', '��. ���������, 32�');

INSERT INTO dbo.Job(Post, Salary) VALUES
	('�������� �� �������� ������������ �����', 400),
	('���������� �� ����������� ��������� ���������', 550),
	('���������� �� ����������� ������������� ���������', 470),
	('Advertising Manager', 700),
	('Business Analyst (Clans)', 800),
	('Middle QA Specialist (Game)', 800),
	('Senior C++/Qt Developer [3D Editor and Tools]', 1000),
	('���������� �������������', 700),
	('���������', 550),
	('������', 480),
	('���������-������', 500),
	('��������', 300),
	('������������� ������ 1�', 200),
	('���������� (SMM - ���������� / ����������)', 600),
	('�������� �� ������ � ��������� � ���������������', 530);

INSERT INTO dbo.Employee(Surname, Name, Birthday) VALUES
	('�����', '��������', '3-06-1978'),
	('��������', '������', '08-01-1980'),
	('�������', '������', '09-14-1972'),
	('���������', '����', '2-05-1968'),
	('���������', '�����', '06-22-1967'),
	('��������', '�������', '11-11-1988'),
	('�������', '��������', '1-06-1981'),
	('�������', '������', '3-02-1965'),
	('�������', '��������', '9-01-1972'),
	('���������', '�����', '7-05-1973'),
	('�����', '�������', '3-08-1985'),
	('���', '������', '4-02-1988'),
	('�������������', '����������', '3-12-1978'),
	('����', '����', '05-14-1978'),
	('������', '�����', '06-16-1990'),
	('������', '������', '3-06-1979'),
	('������������', '��������', '9-03-1991'),
	('��������', '������', '2-06-1992'),
	('����', '�����', '07-27-1978'),
	('�������', '������', '12-03-1973'),
	('�����������', '���������', '06-21-1975'),
	('��������', '�������', '11-05-1977'),
	('���������', '����', '9-07-1981'),
	('������� ', '��������', '3-09-1978'),
	('�������', '����', '4-01-1993'),
	('���', '�����', '3-04-1978'),
	('�������', '�����', '6-05-1968'),
	('����', '����', '3-10-1984'),
	('����', '����', '06-16-1978'),
	('�������', '�����', '10-02-1981');
 
INSERT INTO dbo.Career(IdJob, IdEmployee, IdDepartment, EmploymentDate, DismissalDate) VALUES
	(100, 100, 100, '02-15-2012', NULL),
	(100, 101, 100, '05-19-2010', NULL),
	(101, 102, 100, '09-25-2000', NULL),
	(101, 103, 100, '04-05-2012', NULL),
	(102, 104, 100, '07-11-2011', NULL),
	(102, 105, 100, '12-21-2012', NULL),
	(103, 106, 101, '11-22-2013', NULL),
	(103, 107, 101, '10-15-2013', NULL),
	(104, 108, 101, '01-11-2014', NULL),
	(104, 109, 101, '02-19-2014', NULL),
	(105, 110, 101, '04-17-2012', NULL),
	(105, 111, 101, '08-26-2012', NULL),
	(106, 112, 102, '05-15-2010', NULL),
	(106, 113, 102, '02-13-2005', NULL),
	(107, 114, 102, '09-15-2005', NULL),
	(107, 115, 102, '01-06-2008', NULL),
	(108, 116, 102, '02-05-2009', NULL),
	(108, 117, 102, '09-18-2010', NULL),
	(109, 118, 103, '09-27-2010', NULL),
	(109, 119, 103, '05-25-2012', NULL),
	(110, 120, 103, '08-20-2014', NULL),
	(110, 121, 103, '02-09-2014', NULL),
	(111, 122, 103, '10-08-2012', NULL),
	(111, 123, 103, '09-15-2013', NULL),
	(112, 124, 104, '02-04-2011', NULL),
	(112, 125, 104, '07-12-2011', NULL),
	(113, 126, 104, '06-15-2007', NULL),
	(113, 127, 104, '05-18-2007', NULL),
	(114, 128, 104, '03-13-2008', NULL),
	(114, 129, 104, '01-15-2009', NULL);

INSERT INTO dbo.Salary(IdEmployee, [Month], [Year], SalaryAmount) VALUES
	(100, 1, 2015, 800),
	(100, 2, 2015, 850),
	(100, 3, 2015, 900),
	(100, 4, 2015, 850),
	(100, 5, 2015, 1000),
	(101, 1, 2015, 860),
	(101, 2, 2015, 950),
	(101, 3, 2015, 500),
	(101, 4, 2015, 950),
	(101, 5, 2015, 1030),
	(102, 1, 2015, 800),
	(102, 2, 2015, 820),
	(102, 3, 2015, 990),
	(102, 4, 2015, 950),
	(102, 5, 2015, 1100),
	(103, 1, 2015, 800),
	(103, 2, 2015, 850),
	(103, 3, 2015, 930),
	(103, 4, 2015, 950),
	(103, 5, 2015, 1030),
	(104, 1, 2015, 850),
	(104, 2, 2015, 850),
	(104, 3, 2015, 950),
	(104, 4, 2015, 850),
	(104, 5, 2015, 1500),
	(105, 1, 2015, 800),
	(105, 2, 2015, 850),
	(105, 3, 2015, 500),
	(105, 4, 2015, 850),
	(105, 5, 2015, 1330),
	(106, 1, 2015, 800),
	(106, 2, 2015, 850),
	(106, 3, 2015, 980),
	(106, 4, 2015, 856),
	(106, 5, 2015, 1600),
	(107, 1, 2015, 890),
	(107, 2, 2015, 850),
	(107, 3, 2015, 960),
	(107, 4, 2015, 850),
	(107, 5, 2015, 1000),
	(108, 1, 2015, 860),
	(108, 2, 2015, 850),
	(108, 3, 2015, 940),
	(108, 4, 2015, 840),
	(108, 5, 2015, 1400),
	(109, 1, 2015, 890),
	(109, 2, 2015, 950),
	(109, 3, 2015, 940),
	(109, 4, 2015, 880),
	(109, 5, 2015, 1400),
	(110, 1, 2015, 800),
	(110, 2, 2015, 840),
	(110, 3, 2015, 910),
	(110, 4, 2015, 820),
	(110, 5, 2015, 1030),
	(111, 1, 2015, 855),
	(111, 2, 2015, 870),
	(111, 3, 2015, 900),
	(111, 4, 2015, 850),
	(111, 5, 2015, 1090),
	(112, 1, 2015, 890),
	(112, 2, 2015, 890),
	(112, 3, 2015, 960),
	(112, 4, 2015, 860),
	(112, 5, 2015, 1060),
	(113, 1, 2015, 830),
	(113, 2, 2015, 830),
	(113, 3, 2015, 930),
	(113, 4, 2015, 830),
	(113, 5, 2015, 1060),
	(114, 1, 2015, 860),
	(114, 2, 2015, 890),
	(114, 3, 2015, 900),
	(114, 4, 2015, 850),
	(114, 5, 2015, 1400),
	(115, 1, 2015, 840),
	(115, 2, 2015, 890),
	(115, 3, 2015, 908),
	(115, 4, 2015, 870),
	(115, 5, 2015, 1060),
	(116, 1, 2015, 800),
	(116, 2, 2015, 890),
	(116, 3, 2015, 900),
	(116, 4, 2015, 870),
	(116, 5, 2015, 1600),
	(117, 1, 2015, 890),
	(117, 2, 2015, 850),
	(117, 3, 2015, 950),
	(117, 4, 2015, 890),
	(117, 5, 2015, 1900),
	(118, 1, 2015, 800),
	(118, 2, 2015, 850),
	(118, 3, 2015, 900),
	(118, 4, 2015, 850),
	(118, 5, 2015, 1060),
	(119, 1, 2015, 860),
	(119, 2, 2015, 850),
	(119, 3, 2015, 990),
	(119, 4, 2015, 850),
	(119, 5, 2015, 1700),
	(120, 1, 2015, 890),
	(120, 2, 2015, 890),
	(120, 3, 2015, 990),
	(120, 4, 2015, 850),
	(120, 5, 2015, 1070),
	(121, 1, 2015, 870),
	(121, 2, 2015, 850),
	(121, 3, 2015, 980),
	(121, 4, 2015, 850),
	(121, 5, 2015, 1090),
	(122, 1, 2015, 870),
	(122, 2, 2015, 870),
	(122, 3, 2015, 980),
	(122, 4, 2015, 850),
	(122, 5, 2015, 1000),
	(123, 1, 2015, 800),
	(123, 2, 2015, 850),
	(123, 3, 2015, 970),
	(123, 4, 2015, 850),
	(123, 5, 2015, 1070),
	(124, 1, 2015, 800),
	(124, 2, 2015, 870),
	(124, 3, 2015, 900),
	(124, 4, 2015, 870),
	(124, 5, 2015, 1000),
	(125, 1, 2015, 800),
	(125, 2, 2015, 850),
	(125, 3, 2015, 990),
	(125, 4, 2015, 840),
	(125, 5, 2015, 1700),
	(126, 1, 2015, 800),
	(126, 2, 2015, 850),
	(126, 3, 2015, 930),
	(126, 4, 2015, 800),
	(126, 5, 2015, 1000),
	(127, 1, 2015, 900),
	(127, 2, 2015, 950),
	(127, 3, 2015, 900),
	(127, 4, 2015, 950),
	(127, 5, 2015, 1000),
	(128, 1, 2015, 900),
	(128, 2, 2015, 850),
	(128, 3, 2015, 800),
	(128, 4, 2015, 950),
	(129, 4, 2015, 1000),
	(129, 1, 2015, 1200),
	(129, 2, 2015, 850),
	(129, 3, 2015, 900),
	(129, 4, 2015, 850),
	(129, 5, 2015, 1000),
	(129, 6, 2015, 1060);