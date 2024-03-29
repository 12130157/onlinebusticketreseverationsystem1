USE OnlineBusTicket
go
/********________Table City_____________**********/
/*1______Insert City___________*/
create procedure IsertCity
 (
	@Name varchar(50)
 )

as
insert into City values (@Name) 

go
/*______select all______*/
create procedure SelectCity  
as
select * from City

go
/*_______Update cityID_________*/
create procedure UpdateCityID
@Name varchar(50),
@id int
as
update City set [Name]=@Name where Ci_Id=@id  
go
/*__________Delete CityID_____________*/
create procedure DeleteCityID   
@id int
as
delete from City where Ci_Id=@id 

go
/*2______Insert NewAndEvent___________*/
Create procedure InsertNewAndEvent   
(
	@Title varchar(100),
	@Content varchar(1000),
	@Author varchar(100), 
	@Date datetime,
	@Status bit      
)
as 
begin
insert into NewAndEvent values (@Title,@Content,@Author,@Date,@Status) 
end

go
/*_____select all_________*/
create procedure SelectNewAndEvent  
as
select * from NewAndEvent 
go
/*______SelectbyID___________________*/
create procedure SelectbyID
@id int
as
Select * from NewAndEvent where NE_Id=@id
go
execute SelectbyID '5'
/*_______SelectNameNewAndEvent____________*/
go
create procedure SelectTitleNewAndEvent
@Title varchar(100)
as
select * from NewAndEvent where Title=@Title

go
/*______Update NewAndEventID_____________*/
create procedure UpdateNewAndEventID 
@Title varchar(100),
@Content varchar(1000),
@Author varchar(100), 
@Date datetime,
@Status bit,  
@id int
as
update NewAndEvent set Title=@Title,[Content]=@Content,Author=@Author,Date=@Date,[Status]=@Status where NE_Id=@id 

go
/*Delete NewAndEventID_____________*/
create procedure DeleteNewAndEventID 
@id int
as
delete from NewAndEvent where NE_Id=@id

go

/*3______Insert Admin___________*/
create procedure InsertAdmin 
(
	@UserName varchar(30),
	@Pass varchar(30),
	@FullName varchar(100),
	@Address varchar(100),  
	@PhoneNumber varchar(10)	
)
as 
insert into [Admin] values (@UserName,@Pass,@FullName,@Address,@PhoneNumber)

go
/*_____select all Admin_________*/
create procedure SelectAdmin
as
select * from [Admin]
go
/*_____Select AdminID_____________*/
create procedure SelectAdminID
@id int
as
select * from [Admin] where A_Id = @id
/*______Select Admin Name_____________*/
go
create procedure SelectAdminName
@UserName varchar(30)
as
select * from [Admin] where UserName = @UserName
go
/*______Update AdminID_____________*/
create procedure UpdateAdminID 

	@UserName varchar(30),
	@Pass varchar(30),
	@FullName varchar(100),
	@Address varchar(100),  
	@PhoneNumber varchar(10),
	@id int	

as

update [Admin] set UserName=@UserName,Pass=@Pass,FullName=@FullName,[Address]=@Address,PhoneNumber=@PhoneNumber where A_Id=@id

go
/*Delete AdminID_____________*/
create procedure DeleteAdminID
@id int
as
delete from [Admin] where A_Id=@id


--_________________ Sales_________________
--PROCEDURE INSERT bang Sales
IF OBJECTPROPERTY(object_id('InsertSales'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].InsertSales
GO
CREATE PROCEDURE InsertSales
	@Name VARCHAR(50),
	@MinAge INT,  
	@MaxAge INT,
	@Rate INT ,
	@Status BIT
	AS
	INSERT INTO Sales VALUES(@Name,@MinAge,@MaxAge,@Rate,@Status)
GO
--PROCEDURE DELETE bang Sales
CREATE PROCEDURE DeleteSales
	@Sa_Id INT
	AS
	DELETE Sales WHERE Sa_Id = @Sa_Id
GO
--PROCEDURE SELECT Sales by ID
CREATE PROCEDURE SelectSalesID
	@Sa_Id INT
	AS
	SELECT * FROM Sales WHERE Sa_Id = @Sa_Id
GO
--PROCEDURE SELECT Sales by Name
CREATE PROCEDURE SelectSalesbyName
	@Name VARCHAR(50)
	AS
	SELECT * FROM Sales WHERE [Name] = @Name
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllSales
	AS
	SELECT * FROM Sales
GO
--PROCEDURE UPDATE ID
CREATE PROCEDURE UpdateSalesID
	@Name VARCHAR(50),
	@MinAge INT,  
	@MaxAge INT,
	@Rate INT ,
	@Status BIT,
	@Id INT
AS
UPDATE Sales SET [Name]=@Name,MinAge=@MinAge,MaxAge=@MaxAge,Rate=@Rate,[Status]=@Status where Sa_Id=@Id
GO

--____________________Bang Customer__________________
--PROCEDURE INSERT bang Customer
IF OBJECTPROPERTY(object_id('InsertCustomers'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].InsertCustomers
GO
CREATE PROCEDURE InsertCustomers
(
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@Birthday DATETIME,
	@Address VARCHAR(100),
	@Email VARCHAR(50),
	@RegisterDate DATETIME,	
	@PhoneNumber VARCHAR(10),
	@Sa_Id int,
	@Status BIT
)
	AS
begin
	INSERT INTO Customers VALUES (@FirstName,@LastName,@Birthday,@Address,@Email,@RegisterDate,@PhoneNumber,@Sa_Id,@Status)
end
execute InsertCustomers 'Hung','Pham','3/5/1990','PhucXa','hungpv03051990@gmai.com','2/2/2006','0972681102','5',1
GO
--PROCEDURE DELETE bang Customer
CREATE PROCEDURE DeleteCustomers
	@Cus_Id INT
	AS
	DELETE Customers WHERE Cus_Id = @Cus_Id
GO
--PROCEDURE SELECT Customer by ID
CREATE PROCEDURE SelectCustomersID
	@Cus_Id INT
	AS
	SELECT * FROM Customers WHERE Cus_Id = @Cus_Id
GO
--PROCEDURE SELECT Customer by FirstName
CREATE PROCEDURE SelectCustomersbyFirstName
	@FirstName VARCHAR(50)
	AS
	SELECT * FROM Customers WHERE FirstName = @FirstName
GO
--PROCEDURE SELECT Customer by LastName
CREATE PROCEDURE SelectCustomersbyLastName
	@LastName VARCHAR(50)
	AS
	SELECT * FROM Customers WHERE LastName = @LastName
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllCustomers
	AS
	SELECT * FROM Customers
GO
--PROCEDURE UPDATECUSTOMERSID
if OBJECTPROPERTY(object_id('UpdateCustomersID'),N'IsProcedure')=1
drop procedure [dbo].UpdateCustomersID
go
CREATE PROCEDURE UpdateCustomersID
@Cus_Id INT,
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Birthday DATETIME,
@Address VARCHAR(100),
@Email VARCHAR(50),
@RegisterDate DATETIME,
@PhoneNumber VARCHAR(10),
@Sa_Id INT,
@Status BIT
AS
UPDATE Customers SET FirstName=@FirstName,LastName=@LastName,Birthday=@Birthday,[Address]=@Address,Email=@Email,RegisterDate=@RegisterDate,PhoneNumber=@PhoneNumber,Sa_Id=@Sa_Id,[Status]=@Status

