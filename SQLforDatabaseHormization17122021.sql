--Creating a Database
Create Database PUMA

-- Deleting a Database
DROP Database PUMA
-- Activating the Database because the default database is Master
USE PUMA
-- Inserting table inside the Database
Create Table Customer_Database(CustomerID INT,CustomerName Varchar(30),Age INT)
Create Table Product_Info(CustomerID INT,ProductID INT,ProductName VarChar(30))
-- Viewing the Table 
Select * from Customer_Database
-- Selecting a particular column
Select Age from Customer_Database
--Insert values inside the table
Insert into Customer_Database values (1,'Timothy',24) 
Insert into Customer_Database values (2,'Lourde',25)
Insert into Customer_Database values (3,'Sherwin',26)
Insert into Customer_Database values (4,'Chesca',27)
Insert into Customer_Database values (5,'Mark',28)

Insert into Product_Info values (1,1,'BURGER') 
Insert into Product_Info values (2,2,'SPAGHETTI')
Insert into Product_Info values (3,3,'ICECREAM')
Insert into Product_Info values (6,4,'SOFTDRINKS')
Insert into Product_Info values (7,5,'FRIES')
 

-- Giving conditions to the table
Select * from Customer_Database where AGE>25
-- Giving multiple conditions to the table
-- and operator
Select * from Customer_Database where AGE>25 AND CustomerID > 3
-- OR operator
Select * from Customer_Database where AGE>25 OR CustomerID > 3
-- NOT operator
Select * from Customer_Database where NOT CustomerName='Timothy'

--Altering the table add a column
ALTER TABLE Customer_Database ADD Profit Int
ALTER TABLE Customer_Database ALTER COLUMN Profit Float
ALTER TABLE Customer_Database DROP COLUMN Profit

ALTER TABLE Product_info DROP COLUMN ProductName
ALTER TABLE Product_info ADD ProductID Int
ALTER TABLE Product_info ADD ProductName Varchar(30)

-- 
ALTER TABLE Customer_Database2 ADD Sales Float

-- Updating the Table
UPDATE Customer_Database2 SET Sales=27.28 Where CustomerID=7
UPDATE Customer_Database2 SET Sales=29.28 Where CustomerID=8
UPDATE Customer_Database2 SET Sales=31.28 Where CustomerID=9
UPDATE Customer_Database2 SET Sales=33.28 Where CustomerID=10
UPDATE Customer_Database2 SET Sales=35.28 Where CustomerID=11

Select * from Customer_Database
Select * from Product_Info

DELETE from Customer_Database where CustomerName='Timothy' and CustomerID=1

Insert into Customer_Database values (1,'Timothy',24)

-- Truncate (Deletes data inside the table ) Table Production Info
Truncate Table Product_Info

-- Joining 2 Tables 
-- Key = CustomerID
--Select * from (parent table) inner join (child table) on ( primary table.primarykey=childtable=primary.key)
SELECT * FROM Customer_Database INNER JOIN Product_Info ON Customer_Database.CustomerID = Product_Info.CustomerID

--Select * from (parent table) full outer join (child table) on ( primary table.primarykey=childtable=primary.key)
SELECT * FROM Customer_Database FULL OUTER JOIN Product_Info ON Customer_Database.CustomerID = Product_Info.CustomerID

--Select * from (parent table) left join (child table) on ( primary table.primarykey=childtable=primary.key)
SELECT * FROM Customer_Database LEFT JOIN Product_Info ON Customer_Database.CustomerID = Product_Info.CustomerID

--Select * from (parent table) right join (child table) on ( primary table.primarykey=childtable=primary.key)
SELECT * FROM Customer_Database RIGHT JOIN Product_Info ON Customer_Database.CustomerID = Product_Info.CustomerID

Create table Customer_Database2(CustomerID INT,CustomerName Varchar(30),Age INT)

Insert into Customer_Database2 values (7,'Peter',34) 
Insert into Customer_Database2 values (8,'Soham',35)
Insert into Customer_Database2 values (9,'Paul',36)
Insert into Customer_Database2 values (10,'Roman',37)
Insert into Customer_Database2 values (11,'Sherwin',38)

Select * from Customer_Database
Select * from Customer_Database2

-- Union of two tables 
Select * from Customer_Database UNION Select * from Customer_Database2

-- ingest your superstore

-- Select * from primarytable inner join childtable1 on parentable.primarykey = childtable1.primarykey 
-- inner join childtable2 on parentable.primarykey = childtable2.primarykey

Select * from orders$ inner join Returns$ on orders$.[Order ID] = Returns$.[Order ID]
INNER JOIN orders$.[Region] = Users$.[Region]

SELECT * FROM [dbo].[Orders$] INNER JOIN [dbo].[Returns$] ON [Orders$].[Order ID] = [Returns$].[Order ID]
INNER JOIN [dbo].[Users$] ON [Orders$].[Region] = [Users$].[Region]
-- How to check keyswith two tables

-- Sorting the Data Descending
Select * from orders$ order by [Row ID] desc
-- Sorting the Data Ascending
Select * from orders$ order by [Row ID] ASC

-- Like Operators Wildcards
Select * from orders$ where [Customer Name] Like '%k' 
-- Between Operators 
Select * from orders$ where [Sales] between 2000 and 4000

-- Calculated Field or DAX field (Sales divided by Profit)
Select *, [Sales]/[Profit] as 'S/P' from orders$ 

-- Aggregate Functions Sum Min Max Count AVG
Select SUM([Sales]) From orders$
Select MIN([Sales]) From orders$
Select MAX([Sales]) From orders$
Select COUNT([Sales]) From orders$
Select AVG([Sales]) From orders$

-- Aliasing giving a table name
Select SUM([Sales]) AS SUM From orders$
Select MIN([Sales]) AS MIN From orders$
Select MAX([Sales]) AS MAX From orders$
Select COUNT([Sales]) AS COUNT From orders$
Select AVG([Sales]) AS AVG From orders$

-- Group By needs aggregate Sum of Salesfunctions.
Select sum(Sales) AS 'SUM of Sales' , Region From orders$ group by region

Select sum(Sales) AS 'SUM of Sales' , Region From orders$ group by region having region='West'

-- Creating a VIEW 
Create View group_by_table AS Select sum(Sales) AS 'SUM of Sales' , Region From orders$ group by region
Select * from group_by_table where Region='West'

-- Window  Functions ( Ranking 
-- Rank 
Select * ,Rank()OVER(Order by Sales DESC) AS 'RANK' From Orders$


-- Like, having , group by , in , between , rank , desc

/* Create Table with identical duplicates having column names as CustomerID , CustomerName, Sales ( 10 Entries )*/
/* CustomerID CustomerName Sales 
1,SAM,23
1,SAM,23
1,SAM,23
2,LJ,26
2,LJ,26
3,Timothy,21
3,Timothy,21
3,Timothy,21
3,Timothy,21
3,Timothy,21
4,Roman,41
4,Roman,41
*/

Create Table Customer_Database3(CustomerID INT,CustomerName Varchar(30),Sales INT)

Insert into Customer_Database3 values (1,'Curry',500) 
Insert into Customer_Database3 values (1,'Curry',500) 
Insert into Customer_Database3 values (2,'Thompson',250) 
Insert into Customer_Database3 values (2,'Thompson',250) 
Insert into Customer_Database3 values (3,'Green',300) 
Insert into Customer_Database3 values (3,'Green',300) 
Insert into Customer_Database3 values (3,'Green',300) 
Insert into Customer_Database3 values (3,'Green',300) 
Insert into Customer_Database3 values (3,'Green',300) 
Insert into Customer_Database3 values (4,'Wiggins',450) 
Insert into Customer_Database3 values (4,'Wiggins',450) 

Truncate Table Customer_Database3

select * from Customer_Database3

/* Advanced Function , Windows Function , IF ELSE STATEMENT , CASE Statement , Numeric , String , Stored Procedures ,
Triggers , Deployment in Github */

Select SYSDATETIME ()
Select CURRENT_TIMESTAMP
Select GETUTCDATE ()
Select DAY ('2020-12-05')
Select GETDATE ()
Select GETUTCDATE ()
Select ISDATE ('2020-12-05') 
Select MONTH ('2020-12-05')
Select SYSDATETIME ()
Select YEAR ('2020-12-05')
Select COALESCE (null,null,'jorge','sneha','Besant')    --takes first non null value
Select CONVERT (int,26.85)      
Select SESSION_USER
Select SYSTEM_USER -- current working on the session
Select USER_NAME () -- can vary off

--string functions
 
SELECT CHAR (91)           --ascii code
SELECT CONCAT ('SURESH','---','UNNIKRISHNAN')
SELECT DATALENGTH (' SURESH U')
SELECT LEFT('SURESH',2)
select LEN(' SURESH U')
SELECT LOWER('SURESH')
SELECT LTRIM('   SURESH')
select REPLACE('SURESH','S','R')
SELECT REPLICATE('SURESH ',5)    
select REVERSE('SURESH')
SELECT RIGHT('SURESH',2)
SELECT RTRIM('SURESH   ')
SELECT SUBSTRING('SURESH',3,2)
select UNICODE('A')                  -- Reverse of Char
select UPPER('suresh unnikrishnan')

--**Numeric functions
 
//**
ABS Returns the absolute value of a number**//
 
Select ABS(-18)
 
//**ACOS Returns the arc cosine of a number**//
 
Select Acos (0.5)
 
//**ASIN Returns the arc sine of a number**//
 
Select ASIN(0.5)
 
//**ATAN Returns the arc tangent of one or two numbers**//
 
Select ATAN(0.5)
 
 
--//**CEILING Returns the smallest integer value that is >= to a number**//
 
Select CEILING(26.10)
 

//**COS Returns the cosine of a number**//
 
Select Cos(90)
 

//**COT Returns the cotangent of a number**//
 
Select Cot(90)
 

//**DEGREES Converts a value in radians to degrees**//
 
Select DEGREES(1)
 

//**EXP Returns e raised to the power of a specified number**//
 
Select EXP(1)
 
//**FLOOR Returns the largest integer value that is <= to a number**//
 
Select FLOOR(25.90)
 
//**LOG Returns the natural logarithm of a number, or the logarithm of a number to a specified base**//
 
Select Log(2)
 
//**LOG10 Returns the natural logarithm of a number to base 10**//
 
Select LOG10(10)
 
 
//**PI Returns the value of PI**//
 
Select PI()
 
//**POWER Returns the value of a number raised to the power of another number**//
 
Select POWER(2,3)
 
//**RADIANS Converts a degree value into radians**//
 
Select Radians(90)
 
//**RAND Returns a random number**//
 
Select Rand()
 
//**ROUND Rounds a number to a specified number of decimal places**//
 
Select ROUND(25.68,1)
 
//**SIGN Returns the sign of a number**//
 
Select sign (-9)
 

//**SIN Returns the sine of a number**//
 
Select sin (45)
 
//**SQRT Returns the square root of a number**//
 
Select sqrt (64)
 

--//**TAN Returns the tangent of a number**//
 
Select TAN(90)

/*Connecting SQL Server with Power BI*/

Create table tb4
(
 ID int,
 FirstName nvarchar(50),
 LastName nvarchar(50),
 Gender nvarchar(50),
 Salary int
)
GO

Insert into tb4 values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into tb4 values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into tb4 values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into tb4 values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into tb4 values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into tb4 values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into tb4 values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into tb4 values (3, 'Ben', 'Hoskins', 'Male', 70000)

Select * from tb4

/* Ranking counts the duplicate and consider it as duplicate */

SELECT *,
RANK() OVER (ORDER BY SALARY DESC) AS Rank
    FROM     TB4

-- Dense Rank the numbers are skipped
--Dense Rank--
SELECT *,
DENSE_RANK()
OVER (ORDER BY SALARY DESC) AS DENSERANK
FROM TB4

-- ROW Number 
SELECT *,
ROW_NUMBER()
OVER (ORDER BY SALARY DESC) AS ROWNUMBER
FROM tb4

-- TOP 
SELECT TOP 2 Salary
FROM (
      SELECT DISTINCT TOP 3 Salary
      FROM TB4
      ORDER BY Salary DESC
      ) RESULT
ORDER BY Salary desc

--

WITH OUTPUT AS (SELECT *,DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DENSERANK FROM TB4
Select TOP 1 Salary from OUTPUT where DENSE_RANK=2 


WITH OUTPUT AS (
SELECT *,ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS DENSE_RANK FROM TB4)
Select TOP 1 Salary from OUTPUT where ROW_NUMBER=5

SELECT * FROM OUTPUT WHERE ROW_NUMBER=5

WITH OUTPUT AS (
SELECT *,
ROW_NUMBER()
OVER (ORDER BY SALARY DESC) AS ROW_NUMBER
FROM TB4
) SELECT * FROM OUTPUT WHERE ROW_NUMBER = 5
--Deleting the duplicates--

WITH RESULT AS
(
   SELECT *, ROW_NUMBER()OVER(PARTITION BY ID ORDER BY ID) AS RowNumber
   FROM tb4
)
DELETE FROM RESULT WHERE RowNumber > 1

Select * from tb4

[10:32 am] Soham Ghosh


--if statement--

Create table Employees

(

 Id int primary key identity,  --constraint

 Name nvarchar(10),

 GenderId int

)

select * from Employees
Go

select * from Employees 
Insert into Employees values ('Mark', 1)

Insert into Employees values ('John', 1)

Insert into Employees values ('Amy', 2)

Insert into Employees values ('Ben', 1)

Insert into Employees values ('Sara', 2)

Insert into Employees values ('David', 1) --Using CASE statement--



SELECT Name, GenderId, 
CASE WHEN GenderId = 1
THEN 'Male'
ELSE 'Female'
END AS Gender
FROM Employees 

--Using iif statement

SELECT Name, GenderId, IIF(GenderId = 1, 'Male', 'Female') AS Gender
FROM Employees


-- SQL If Else Example-- --Declaring Number and Total Variables

DECLARE @Marks INT = 57 ; IF @marks > = 50

BEGIN

   PRINT ' Congratulations ';

   PRINT ' You pass the Examination ';

END

ELSE

BEGIN

   PRINT ' You Failed ';

   PRINT ' Better Luck Next Time ';

END 

-- SQL Else If Example-- --Declaring Total Marks Out of 1000

DECLARE @Total_Marks INT = 500 ; IF @Total_Marks > = 900

BEGIN

   PRINT ' Congratulations ';

   PRINT ' You are eligible for Full Scholarship ';

END

ELSE IF @Total_Marks > = 800

BEGIN

   PRINT ' Congratulations ';

   PRINT ' You are eligible for 50 Percent Scholarship ';

END

ELSE IF @Total_Marks > = 750

BEGIN

   PRINT ' Congratulations ';

   PRINT ' You are eligible for 10 Percent Scholarship ';

END

ELSE

BEGIN

   PRINT ' You are Not eligible for Scholarship ';

   PRINT ' We are really Sorry for You ';

END


--go to statement--
 
DECLARE @TotalMaarks INT
SET @TotalMaarks = 3
 
IF @TotalMaarks >= 50
    GOTO Pass
IF @TotalMaarks < 50
    GOTO Fail
 
Pass:
    PRINT ' Congratulations '
    PRINT ' You pass the Examination '
    RETURN
 
Fail:
    PRINT ' You Failed! '
    PRINT ' Better Luck Next Time '
    RETURN
GO
 
--5 lang in sql DDL,DML,DCL,DQL,TCL--
--DDL- data definition lang 
--it holds the command 
--create,drop,alter,truncate
 
--DQL- data query lang
--it holds select command
 
--DML- data manipulation lang
--insert, update,delete
 
--DCL-data control lang
--it holds the command grant and revoke 
 
--TCL- transcation control lang
--it holds the command 
--commit,rollback,safepoint,set transcation
 
--normalisation ( integrating to another table / breaking down the table )
--normalisation is breaking down a historical table into 5 diff segements
--they are 5 rules of normalisation
 
--for the version
SELECT @@VERSION AS 'SQL Server Version'
 
--username--
SELECT @@VERSION AS 'SQL Server Version'
SELECT @@SPID AS 'SP ID', 
       SYSTEM_USER AS 'Login Name', 
       USER AS 'User Name';
 
--lang name--
SELECT @@LANGUAGE AS 'Language Name'
 
--lang Id--
SELECT @@LANGID AS 'Language ID Number'
 
--max/min connections--
SELECT @@MAX_CONNECTIONS AS 'Maximum Connections'
 
--precision-- decimal points
SELECT @@MAX_PRECISION AS 'Maximum Precision Value'
 
--server name--
SELECT @@SERVERNAME AS 'Server Name'
 
--service name--
SELECT @@SERVICENAME AS 'Service Name'
 
--choose command--
SELECT CHOOSE(2, 'Apple', 'Orange', 'Kiwi', 'Cherry') AS Result2;
 
select * from Orders$

--concat--
select * , CONCAT( [Customer Name],',',[Ship Mode])
as 'First name' from Orders$


--creating store procedure--

create procedure P1 as 
select [dbo].[Orders$].[Region],[Sales] from [dbo].[Orders$]
full outer join [dbo].[Returns$] on [dbo].[Orders$].[Order ID] = [dbo].[Returns$].[Order ID]
full outer join [dbo].[Users$] on [dbo].[Orders$].[Region] = [dbo].[Users$].[Region] 
 
select * from Result
 
where [Region]='West'
 
execute P1

Select * from p4

create procedure P4 as
truncate table Employees
Insert into Employees values ('Mark', 1)
Insert into Employees values ('John', 1)
Insert into Employees values ('Amy', 2)
Insert into Employees values ('Ben', 1)
Insert into Employees values ('Sara', 2)
Insert into Employees values ('David', 1)
 
SELECT Name, GenderId, IIF(GenderId = 1, 'Male', 'Female') AS Gender
FROM Employees
 
execute P4
 
--trigger--
CREATE TABLE Employee_Test
(
Emp_ID INT Identity,
Emp_name Varchar(100),
Emp_Sal Decimal (10,2)
)

INSERT INTO Employee_Test VALUES ('Rohit',10000);
INSERT INTO Employee_Test VALUES ('Vikas',12000);
INSERT INTO Employee_Test VALUES ('Alen',110000);
INSERT INTO Employee_Test VALUES ('Vickey',130000);
INSERT INTO Employee_Test VALUES ('Maria',10000);
 
/* track who has inserted the data */
CREATE TABLE Employee_Test_Audit
(
Emp_ID int,
Emp_name varchar(100),
Emp_Sal decimal (10,2),
Audit_Action varchar(100),
Audit_Timestamp datetime
)
select * from Employee_Test
select * from Employee_Test_Audit
 
CREATE TRIGGER trgAfterInsert ON [dbo].[Employee_Test] 
FOR INSERT
AS
    declare @empid int;
    declare @empname varchar(100);
    declare @empsal decimal(10,2);
    declare @audit_action varchar(100);
 
    select @empid=i.Emp_ID from inserted i;    -- inserted i is the command line for insertion
    select @empname=i.Emp_Name from inserted i;    
    select @empsal=i.Emp_Sal from inserted i;    
    set @audit_action='Inserted Record -- After Insert Trigger.';
 
    insert into Employee_Test_Audit
           (Emp_ID,Emp_Name,Emp_Sal,Audit_Action,Audit_Timestamp) 

values(@empid,@empname,@empsal,@audit_action,getdate());
 
    PRINT 'AFTER INSERT trigger fired.'
GO
 
insert into Employee_Test values('john',4000);

