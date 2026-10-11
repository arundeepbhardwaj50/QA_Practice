CREATE TABLE department 
(DeptID INT PRIMARY KEY, DeptName VARCHAR(200));

CREATE TABLE Employees 
(   EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    Salary DECIMAL(10,2),
    City VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DeptID INT,
    ManagerID INT NULL,
    JoinDate DATE DEFAULT GETDATE(),

    FOREIGN KEY (DeptID)
    REFERENCES Department(DeptID)
);

INSERT INTO Department
VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Sales');

INSERT INTO Employees
(EmpName,Age,Salary,City,Email,DeptID,ManagerID)

VALUES

('Arun',25,50000,'Mumbai','arun@gmail.com',2,NULL),

('Sweety',28,60000,'Delhi','sweety@gmail.com',1,1),

('Rahul',30,70000,'Pune','rahul@gmail.com',2,1),

('Priya',27,55000,'Mumbai','priya@gmail.com',3,3),

('Amit',35,80000,'Delhi','amit@gmail.com',4,3),

('Kiran',26,NULL,'Pune','kiran@gmail.com',2,1),

('Neha',24,45000,'Mumbai','neha@gmail.com',1,2),

('Rohan',32,75000,'Delhi','rohan@gmail.com',4,5);

SELECT * FROM Employees WHERE City='Mumbai';

SELECT * FROM Employees WHERE City='Mumbai' AND Salary > 45000;

SELECT * FROM Employees WHERE City='Mumbai' OR City='Delhi';
SELECT * FROM Employees
SELECT * FROM department

SELECT DISTINCT DEPTID FROM department
SELECT COUNT(DISTINCT DEPTID) FROM DEPARTMENT

SELECT * FROM DEPARTMENT WHERE DEPTID='1';
SELECT * FROM EMPLOYEES WHERE DEPTID='1';

SELECT DEPTID, MANAGERID FROM EMPLOYEES WHERE DEPTID='2' AND MANAGERID='1';

SELECT * FROM EMPLOYEES ORDER BY DEPTID

SELECT
    D.DeptID,
    D.DeptName,
    COUNT(E.EmpID) AS EmployeeCount
FROM Department D
LEFT JOIN Employees E
    ON D.DeptID = E.DeptID
GROUP BY D.DeptID, D.DeptName
ORDER BY D.DeptID;

CREATE TABLE PERSONS
(ID INT IDENTITY(1,1) PRIMARY KEY,
[NAME] VARCHAR(255),
[LOCATION] VARCHAR(255),
[MONEY] INT);

INSERT INTO PERSONS
([NAME], [LOCATION], [MONEY])
VALUES
('ARUN','CHEMBUR',10000),
('SWEETY','THANE',50000),
('SUNNY','ULWE',20000),
('RANA','TILAKNAGAR',60000),
('AKASH','HIMACHAL',40000),
('ROHIT','GOREGAON',30000),
('VIKAS','CHEMBUR',80000),
('UMESH','CHEMBUR',90000),
('ABUZAR','BHOPAL',100000),
('TAISEER','MIRAROAD',70000);

DBCC CHECKIDENT ('PERSONS', NORESEED);
DBCC CHECKIDENT ('PERSONS', RESEED, 10);
DBCC CHECKIDENT ('PERSONS', RESEED, 0);

CREATE TABLE JOB (
ID INT IDENTITY(1,1) PRIMARY KEY,
[NAME] VARCHAR(255),
[LOCATION] VARCHAR(255),
[MONEY] INT,
EMAILID VARCHAR(255),
[PROFILE] VARCHAR(255),
DEPARTMENT VARCHAR(255));

INSERT INTO JOB ([NAME],[LOCATION],[MONEY],EMAILID,[PROFILE],DEPARTMENT) VALUES
('ARUN','CHEMBUR',10000,'arundeepbhardwaj50@gmail.com','Manual Tester','Testing'),
('SWEETY','THANE',50000,'sweetygupta@gmail.com','SQL','SQL DEVELOPER'),
('RANA','TILAKNAGAR',60000,'umeshkulariya@gmail.com','call center','Calling'),
('ROHIT','GOREGAON',30000,'rohitdhiman@gmail.com','props','bollywood'),
('SUNNY','ULWE',20000,'sunnyverma@gmail.com','','home'),
('AKASH','HIMACHAL',40000,'akashkaushal@gmail.com','aluminium','fabrication'),
('VIKAS','CHEMBUR',80000,'vikaspatel@gmail.com','Television','Repairwork'),
('ABUZAR','BHOPAL',100000,'abuzarkhan@gmail.com','flutter','developer'),
('UMESH','CHEMBUR',90000,'umeshraisinghania@gmail.com','manager','jewellery'),
('TAISEER','MIRAROAD',70000,'taiseer@gmail.com','server','devops');

SELECT * FROM JOB
SELECT * FROM PERSONS

DBCC CHECKIDENT ('JOBS', NORESEED);
DBCC CHECKIDENT ('JOBS', RESEED, 10);
DBCC CHECKIDENT ('JOBS', RESEED, 0);

SELECT PERSONS.[NAME], JOB.[NAME] FROM JOB LEFT JOIN PERSONS ON PERSONS.[NAME] = JOB.[NAME];
SELECT PERSONS.[NAME], JOB.[NAME] FROM JOB RIGHT JOIN PERSONS ON PERSONS.[NAME] = JOB.[NAME];

SELECT JOB.ID,JOB.[NAME],JOB.[LOCATION],JOB.[MONEY],JOB.[EMAILID],JOB.[PROFILE],JOB.[DEPARTMENT],PERSONS.ID,PERSONS.[NAME]
FROM JOB 
INNER JOIN PERSONS
ON JOB.ID=PERSONS.ID;


SELECT JOB.ID,JOB.[NAME],JOB.[LOCATION],JOB.[MONEY],JOB.[EMAILID],JOB.[PROFILE],JOB.[DEPARTMENT],PERSONS.ID,PERSONS.[NAME] 
FROM JOB 
FULL OUTER JOIN PERSONS 
ON JOB.ID=PERSONS.ID;

SELECT * FROM JOB
SELECT * FROM PERSONS

SELECT [NAME] AS NEWPEOPLE
FROM JOB
UNION ALL
SELECT [LOCATION]
FROM PERSONS

SELECT * FROM JOB

SELECT MIN(MONEY)
FROM JOB

SELECT MAX(MONEY)
FROM JOB

SELECT SUM(MONEY)
FROM JOB

SELECT AVG(MONEY)
FROM JOB

SELECT [NAME], SUM([MONEY]), EMAILID
FROM JOB
WHERE condition
GROUP BY column1, column3
HAVING condition -- The condition on grouped data
ORDER BY column_name;