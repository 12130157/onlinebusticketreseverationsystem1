USE OnlineBusTicket
GO
--############################Bang Bustype#############################
--PROCEDURE INSERT bang Bustype
CREATE PROCEDURE InsertBusType
	@Name VARCHAR(30),
	@Description varchar(1000),
	@Price money,
	@Status BIT
	AS
	INSERT INTO BusType VALUES (@Name,@Description,@Price,@Status)
GO
--PROCEDURE DELETE bang BusType
CREATE PROCEDURE DeleteBusTypeByID
	@BT_Id INT
	AS
	DELETE Bustype WHERE BT_Id = @BT_Id
GO
--PROCEDURE SELECT BusType by ID
CREATE PROCEDURE SelectBusTypeByID
	@BT_Id INT
	AS
	SELECT * FROM BusType WHERE BT_Id=@BT_Id
GO
--PROCEDURE SELECT BusType by Name
CREATE PROCEDURE SelectBusTypeByName
	@Name VARCHAR(30)
	AS
	SELECT * FROM BusType WHERE [Name]=@Name
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllBusType
	AS
	SELECT * FROM BusType
GO
--############################Bang City############################
--PROCEDURE INSERT bang City
CREATE PROCEDURE InsertCity
	@Name varchar(50)
	AS
	INSERT INTO City VALUES (@Name)
GO
--PROCEDURE DELETE bang City
CREATE PROCEDURE DeleteCity
	@Ci_Id int 
	AS
	DELETE City WHERE Ci_Id = @Ci_Id
GO
--PROCEDURE SELECT City by ID
CREATE PROCEDURE SelectCity
	@Ci_Id int 
	AS
	SELECT * FROM City WHERE Ci_Id = @Ci_Id
GO
--PROCEDURE SELECT City by Name
CREATE PROCEDURE SelectCitybyName
	@Name varchar(50)
	AS
	SELECT * FROM City WHERE [Name] = @Name
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllCity
	AS
	SELECT * FROM City
GO
--#############################Bang Route#########################
--PROCEDURE INSERT bang Route
CREATE PROCEDURE InsertRoute
	@Name varchar(100),
	@StartPlace varchar(50),
	@EndPlace varchar(50),
	@Distance int,								
	@StartDate datetime,
	@Price money,
	@Description varchar(200),
	@Status BIT
	AS
	INSERT INTO [Route] VALUES (@Name,@StartPlace,@EndPlace,@Distance,@StartDate,@Price,@Description,@Status)
GO
--PROCEDURE DELETE bang Route
CREATE PROCEDURE DeleteRoute
	@Rou_Id INT
	AS
	DELETE [Route] WHERE Rou_Id = @Rou_Id
GO
--PROCEDURE SELECT Route by ID
CREATE PROCEDURE SelectRoute
	@Rou_Id INT
	AS
	SELECT * FROM [Route] WHERE Rou_Id = @Rou_Id
GO
--PROCEDURE SELECT Route by Name
CREATE PROCEDURE SelectRoutebyName
	@Name varchar(100)
	AS
	SELECT * FROM [Route] WHERE [Name] = @Name
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllRoute
	AS
	SELECT * FROM [Route]
GO
--###########################Bang Packing_Place####################
--PROCEDURE INSERT bang Packing_Place
CREATE PROCEDURE InsertPacking_Place
	@Name VARCHAR(50),
	@Ci_Id int,
	@Status BIT
	AS
	INSERT INTO Packing_Place VALUES (@Name,@Ci_Id,@Status)
GO
--PROCEDURE DELETE bang Packing_Place
CREATE PROCEDURE DeletePacking_Place
	@PP_Id INT
	AS
	DELETE Packing_Place WHERE PP_Id = @PP_Id
GO
--PROCEDURE SELECT Packing_Place by ID
CREATE PROCEDURE SelectPacking_Place
	@PP_Id INT
	AS
	SELECT * FROM Packing_Place WHERE PP_Id = @PP_Id
GO
--PROCEDURE SELECT Packing_Place by Name
CREATE PROCEDURE SelectPacking_PlacebyName
	@Name VARCHAR(50)
	AS
	SELECT * FROM Packing_Place WHERE [Name] = @Name
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllPacking_Place
	AS
	SELECT * FROM Packing_Place
GO
--##############################Bang Bus##########################
--PROCEDURE INSERT bang Bus
CREATE PROCEDURE InsertBus
	@Bus_number CHAR(5),
	@StartTime DATETIME,
	@EndTime DATETIME,
	@EspectedTime VARCHAR(30),
	@Seat INT,
	@BT_Id  INT,
	@Rou_Id INT,
	@PP_Id INT,
	@Status BIT
	AS
	INSERT INTO Bus VALUES (@Bus_number,@StartTime,@EndTime,@EspectedTime,@Seat,@BT_Id,@Rou_Id,@PP_Id,@Status)
GO
--PROCEDURE DELETE bang Bus
CREATE PROCEDURE DeleteBus
	@Bus_number CHAR(5)
	AS
	DELETE Bus WHERE Bus_number = @Bus_number
GO
--PROCEDURE SELECT Bus by ID
CREATE PROCEDURE SelectBus
	@Bus_number CHAR(5)
	AS
	SELECT * FROM Bus WHERE Bus_number = @Bus_number
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllBus
	AS
	SELECT * FROM Bus
GO
--###########################Bang Sales#########################
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
CREATE PROCEDURE SelectSales
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
--############################Bang Customer#######################
--PROCEDURE INSERT bang Customer
CREATE PROCEDURE InsertCustomers
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
	INSERT INTO Customers VALUES (@FirstName,@LastName,@Birthday,@Address,@Email,@RegisterDate,@PhoneNumber,@Sa_Id,@Status)
GO
--PROCEDURE DELETE bang Customer
CREATE PROCEDURE DeleteCustomers
	@Cus_Id INT
	AS
	DELETE Customers WHERE Cus_Id = @Cus_Id
GO
--PROCEDURE SELECT Customer by ID
CREATE PROCEDURE SelectCustomers
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
--##############################Bang Branch############################
--PROCEDURE INSERT bang Branch
CREATE PROCEDURE InsertBranch
	@Name VARCHAR(100),
	@PhoneNumber VARCHAR(10),
	@Address VARCHAR(100),
	@Status BIT 
	AS
	INSERT INTO Branch VALUES(@Name,@PhoneNumber,@Address,@Status)
GO
--PROCEDURE DELETE bang Branch
CREATE PROCEDURE DeleteBranch
	@B_id INT
	AS
	DELETE Branch WHERE B_id = @B_id
GO
--PROCEDURE SELECT Branch by ID
CREATE PROCEDURE SelectBranch
	@B_id INT
	AS
	SELECT * FROM Branch WHERE B_id = @B_id
GO
--PROCEDURE SELECT Branch by Name
CREATE PROCEDURE SelectBranchbyName
	@Name VARCHAR(100)
	AS
	SELECT * FROM Branch WHERE [Name] = @Name
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllBranch
	AS
	SELECT * FROM Branch
GO
Create procedure UpdateBranch
	@B_id INT,
	@Name VARCHAR(100),
	@PhoneNumber VARCHAR(10),
	@Address VARCHAR(100),
	@Status BIT 
	AS
	update Branch set [Name]=@Name,PhoneNumber=@PhoneNumber,Address=@Address,[Status]=@Status where B_id =@B_id
GO
--################################Bang Level_Authority#########################
--PROCEDURE INSERT bang Level_Authority
CREATE PROCEDURE InsertLevel_Authority
	@Name VARCHAR(50),
	@Status BIT
	AS
	INSERT INTO Level_Authority VALUES(@Name,@Status)
GO
--PROCEDURE DELETE bang Level_Authority
CREATE PROCEDURE DeleteLevel_Authority
	@LV_Id INT
	AS
	DELETE Level_Authority WHERE LV_Id = @LV_Id
GO
--PROCEDURE SELECT Level_Authority by ID
CREATE PROCEDURE SelectLevel_Authority
	@LV_Id INT
	AS
	SELECT * FROM Level_Authority WHERE LV_Id = @LV_Id
GO
--PROCEDURE SELECT Level_Authority by Name
CREATE PROCEDURE SelectLevel_AuthoritybyName
	@Name VARCHAR(50)
	AS
	SELECT * FROM Level_Authority WHERE [Name] = @Name
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllLevel_Authority
	AS
	SELECT * FROM Level_Authority
GO
--PROCEDURE INSERT bang Level_Authority
CREATE PROCEDURE UpdateLevel_Authority
	@LV_Id INT,
	@Name VARCHAR(50),
	@Status BIT
	AS
	update Level_Authority set [Name]=@Name,Status=@Status where LV_Id =@LV_Id
GO
--#############################Bang Employee############################
--PROCEDURE INSERT bang Employee
CREATE PROCEDURE InsertEmployee
	@E_Id CHAR(6),
	@Firstname VARCHAR(20),
	@Lastname VARCHAR(20),
	@UserName VARCHAR(30), 
	@Pass VARCHAR(30),
	@Qualification VARCHAR(30),
	@Birthday DATETIME,
	@Location INT,
	@LV_Id INT,
	@Status BIT     
	AS
	INSERT INTO Employee VALUES(@E_Id,@Firstname,@Lastname,@UserName,@Pass,@Qualification,@Birthday,@Location,@LV_Id,@Status)
GO
--PROCEDURE DELETE bang Employee
CREATE PROCEDURE DeleteEmployee
	@E_Id CHAR(6)
	AS
	DELETE Employee WHERE E_Id = @E_Id
GO
--PROCEDURE SELECT Employee by ID
CREATE PROCEDURE SelectEmployee
	@E_Id CHAR(6)
	AS
	SELECT * FROM Employee WHERE E_Id = @E_Id
GO
--PROCEDURE SELECT Employee by FirstName
CREATE PROCEDURE SelectEmployeebyFirstName
	@Firstname VARCHAR(20)
	AS
	SELECT * FROM Employee WHERE Firstname = @Firstname
GO
--PROCEDURE SELECT Employee by LastName
CREATE PROCEDURE SelectEmployeebyLastName
	@LastName VARCHAR(20)
	AS
	SELECT * FROM Employee WHERE LastName = @LastName
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllEmployee
	AS
	SELECT * FROM Employee

GO
Create procedure UpdateEmployee
	@E_Id CHAR(6),
	@Firstname VARCHAR(20),
	@Lastname VARCHAR(20),
	@UserName VARCHAR(30),
	@Pass VARCHAR(30),
	@Qualification VARCHAR(30),
	@Birthday DATETIME,
	@Location INT,
	@LV_Id INT,
	@Status BIT   
	AS
	update Employee set Firstname=@Firstname,Lastname=@Lastname,UserName=@UserName,Pass=@Pass,Qualification=@Qualification,Birthday=@Birthday,Location=@Location,LV_Id=@LV_Id,Status=@Status where E_Id =@E_Id

GO
--################################Bang Ticket############################
--PROCEDURE INSERT bang Ticket
CREATE PROCEDURE InsertTicket
	@Price MONEY,
	@Cus_Id INT,
	@StartDate DATETIME,
	@Bus_number CHAR(5),
	@Rou_Id INT,
	@SeatNumber int,
	@Returnted BIT,
	@Status BIT
	AS
	INSERT INTO Ticket VALUES(@Price,@Cus_Id,@StartDate,@Bus_number,@Rou_Id,@SeatNumber,@Returnted,@Status)
GO
--PROCEDURE DELETE bang Ticket
CREATE PROCEDURE DeleteTicket
	@T_Id INT
	AS
	DELETE Ticket WHERE T_Id = @T_Id
GO
--PROCEDURE SELECT Ticket by ID
CREATE PROCEDURE SelectTicket
	@T_Id INT
	AS
	SELECT * FROM Ticket WHERE T_Id = @T_Id
GO
--PROCEDURE SELECT Ticket by Price
CREATE PROCEDURE SelectTicketbyPrice
	@Price MONEY
	AS
	SELECT * FROM Ticket WHERE Price = @Price
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllTicket
	AS
	SELECT * FROM Ticket
GO
--############################Bang TicketReturn###########################
--PROCEDURE INSERT bang TicketReturn
CREATE PROCEDURE InsertTicketReturn
	@TR_Id INT,
	@RetuneDate DATETIME,
	@Diminish INT,
	@ReturnPrice MONEY
	AS
	INSERT INTO TicketReturn VALUES(@TR_Id,@RetuneDate,@Diminish,@ReturnPrice)
GO
--PROCEDURE DELETE bang TicketReturn
CREATE PROCEDURE DeleteTicketReturn
	@TR_Id INT
	AS
	DELETE TicketReturn WHERE TR_Id = @TR_Id
GO
--PROCEDURE SELECT TicketReturn by ID
CREATE PROCEDURE SelectTicketReturn
	@TR_Id INT
	AS
	SELECT * FROM TicketReturn WHERE TR_Id = @TR_Id
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllTicketReturn
	AS
	SELECT * FROM TicketReturn
GO
--#############################Bang NewAndEvent############################
--PROCEDURE INSERT bang NewAndEvent
CREATE PROCEDURE InsertNewAndEvent
	@Title VARCHAR(100),
	@Content VARCHAR(100),
	@Author VARCHAR(100),
	@Date DATETIME,
	@Status bit 
	AS
	INSERT INTO NewAndEvent VALUES(@Title,@Content,@Author,@Date,@Status)
GO
--PROCEDURE DELETE bang NewAndEvent
CREATE PROCEDURE DeleteNewAndEvent
	@NE_Id INT
	AS
	DELETE NewAndEvent WHERE NE_Id = @NE_Id
GO
--PROCEDURE SELECT NewAndEvent by ID
CREATE PROCEDURE SelectNewAndEvent
	@NE_Id INT
	AS
	SELECT * FROM NewAndEvent WHERE NE_Id = @NE_Id
GO
--PROCEDURE SELECT NewAndEvent by Title
CREATE PROCEDURE SelectNewAndEventbyTitle
	@Title VARCHAR(100)
	AS
	SELECT * FROM NewAndEvent WHERE Title = @Title
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllNewAndEvent
	AS
	SELECT * FROM NewAndEvent
GO
--#############################Bang Admin##########################
--PROCEDURE INSERT bang Admin
CREATE PROCEDURE InsertAdmin
	@UserName VARCHAR(30),
	@Pass VARCHAR(30),
	@FullName VARCHAR(100),
	@Address VARCHAR(100),
	@PhoneNumber VARCHAR(10)
	AS
	INSERT INTO [Admin] VALUES(@UserName,@Pass,@FullName,@Address,@PhoneNumber)
GO
--PROCEDURE DELETE bang Admin
CREATE PROCEDURE DeleteAdmin
	@A_Id INT
	AS
	DELETE Admin WHERE A_Id = @A_Id
GO
--PROCEDURE SELECT Admin by ID
CREATE PROCEDURE SelectAdmin
	@A_Id INT
	AS
	SELECT * FROM Admin WHERE A_Id = @A_Id
GO
--PROCEDURE SELECT Admin by UserName
CREATE PROCEDURE SelectAdminbyUserName
	@UserName INT
	AS
	SELECT * FROM ADMIN WHERE UserName = @UserName
GO
--PROCEDURE SELECT all
CREATE PROCEDURE SelectAllAdmin
	AS
	SELECT * FROM ADMIN