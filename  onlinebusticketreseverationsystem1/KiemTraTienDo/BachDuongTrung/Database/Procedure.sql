use OnlineBusTicket

--############################Bang Bustype#############################
--Procedure Insert bang Bustype
create procedure InsertBusType
	@Name VARCHAR(30),
	@Description varchar(1000),
	@Price money,
	@Status BIT
	AS
	insert into BusType values (@Name,@Description,@Price,@Status)

--Procedure Delete bang BusType
create procedure DeleteBusType
	@BT_Id INT
	AS
	delete Bustype where BT_Id = @BT_Id

--Procedure Select BusType by ID
create procedure SelectBusTypeByID
	@BT_Id INT
	AS
	select * from BusType where BT_Id=@BT_Id

--Procedure Select BusType by Name
create procedure SelectBusTypeByName
	@Name VARCHAR(30)
	AS
	select * from BusType where [Name]=@Name

--############################Bang City############################
--Procedure Insert bang City
create procedure InsertCity
	@Name varchar(50)
	AS
	insert into City values (@Name)

--Procedure Delete bang City
create procedure DeleteCity
	@Ci_Id int 
	AS
	delete City where Ci_Id = @Ci_Id

--Procedure Select City by ID
create procedure SelectCity
	@Ci_Id int 
	AS
	select * from City where Ci_Id = @Ci_Id

--Procedure Select City by Name
create procedure SelectCitybyName
	@Name varchar(50)
	AS
	select * from City where [Name] = @Name

--#############################Bang Route#########################
--Procedure Insert bang Route
create procedure InsertRoute
	@Name varchar(100),
	@StartPlace varchar(50),
	@EndPlace varchar(50),
	@Distance int,								
	@StartDate datetime,
	@Price money,
	@Description varchar(200),
	@Status BIT
	AS
	insert into [Route] values (@Name,@StartPlace,@EndPlace,@Distance,@StartDate,@Price,@Description,@Status)

--Procedure Delete bang Route
create procedure DeleteRoute
	@Rou_Id INT
	AS
	delete [Route] where Rou_Id = @Rou_Id

--Procedure Select Route by ID
create procedure SelectRoute
	@Rou_Id INT
	AS
	select * from [Route] where Rou_Id = @Rou_Id

--Procedure Select Route by Name
create procedure SelectRoutebyName
	@Name varchar(100)
	AS
	select * from [Route] where [Name] = @Name

--###########################Bang Packing_Place####################
--Procedure Insert bang Packing_Place
create procedure InsertPacking_Place
	@Name VARCHAR(50),
	@Ci_Id int,
	@Status BIT
	AS
	insert into Packing_Place values (@Name,@Ci_Id,@Status)

--Procedure Delete bang Packing_Place
create procedure DeletePacking_Place
	@PP_Id INT
	AS
	delete Packing_Place where PP_Id = @PP_Id

--Procedure Select Packing_Place by ID
create procedure SelectPacking_Place
	@PP_Id INT
	AS
	select * from Packing_Place where PP_Id = @PP_Id

--Procedure Select Packing_Place by Name
create procedure SelectPacking_PlacebyName
	@Name VARCHAR(50)
	AS
	select * from Packing_Place where [Name] = @Name

--##############################Bang Bus##########################
--Procedure Insert bang Bus
create procedure InsertBus
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
	insert into Bus values (@Bus_number,@StartTime,@EndTime,@EspectedTime,@Seat,@BT_Id,@Rou_Id,@PP_Id,@Status)

--Procedure Delete bang Bus
create procedure DeleteBus
	@Bus_number CHAR(5)
	AS
	delete Bus where Bus_number = @Bus_number

--Procedure Select Bus by ID
create procedure SelectBus
	@Bus_number CHAR(5)
	AS
	select * from Bus where Bus_number = @Bus_number

--###########################Bang Sales#########################
--Procedure Insert bang Sales
create procedure InsertSales
	@Name VARCHAR(50),
	@MinAge INT,  
	@MaxAge INT,
	@Rate INT ,
	@Status BIT
	AS
	insert into Sales values(@Name,@MinAge,@MaxAge,@Rate,@Status)

--Procedure Delete bang Sales
create procedure DeleteSales
	@Sa_Id INT
	AS
	delete Sales where Sa_Id = @Sa_Id

--Procedure Select Sales by ID
create procedure SelectSales
	@Sa_Id INT
	AS
	select * from Sales where Sa_Id = @Sa_Id

--Procedure Select Sales by Name
create procedure SelectSalesbyName
	@Name VARCHAR(50)
	AS
	select * from Sales where [Name] = @Name

--############################Bang Customer#######################
--Procedure Insert bang Customer
create procedure InsertCustomers
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
	insert into Customers values (@FirstName,@LastName,@Birthday,@Address,@Email,@RegisterDate,@PhoneNumber,@Sa_Id,@Status)

--Procedure Delete bang Customer
create procedure DeleteCustomers
	@Cus_Id INT
	AS
	delete Customers where Cus_Id = @Cus_Id

--Procedure Select Customer by ID
create procedure SelectCustomers
	@Cus_Id INT
	AS
	select * from Customers where Cus_Id = @Cus_Id

--Procedure Select Customer by FirstName
create procedure SelectCustomersbyFirstName
	@FirstName VARCHAR(50)
	AS
	select * from Customers where FirstName = @FirstName

--Procedure Select Customer by LastName
create procedure SelectCustomersbyLastName
	@LastName VARCHAR(50)
	AS
	select * from Customers where LastName = @LastName

--##############################Bang Branch############################
--Procedure Insert bang Branch
create procedure InsertBranch
	@Name VARCHAR(100),
	@PhoneNumber VARCHAR(10),
	@Address VARCHAR(100),
	@Status BIT 
	AS
	insert into Branch values(@Name,@PhoneNumber,@Address,@Status)

--Procedure Delete bang Branch
create procedure DeleteBranch
	@B_id INT
	AS
	delete Branch where B_id = @B_id

--Procedure select Branch by ID
create procedure SelectBranch
	@B_id INT
	AS
	select * from Branch where B_id = @B_id

--Procedure select Branch by Name
create procedure SelectBranchbyName
	@Name VARCHAR(100)
	AS
	select * from Branch where [Name] = @Name

--################################Bang Level_Authority#########################
--Procedure Insert bang Level_Authority
create procedure InsertLevel_Authority
	@Name VARCHAR(50),
	@Status BIT
	AS
	insert into Level_Authority values(@Name,@Status)

--Procedure Delete bang Level_Authority
create procedure DeleteLevel_Authority
	@LV_Id INT
	AS
	delete Level_Authority where LV_Id = @LV_Id

--Procedure Select Level_Authority by ID
create procedure SelectLevel_Authority
	@LV_Id INT
	AS
	select * from Level_Authority where LV_Id = @LV_Id

--Procedure Select Level_Authority by Name
create procedure SelectLevel_AuthoritybyName
	@Name VARCHAR(50)
	AS
	select * from Level_Authority where [Name] = @Name

--#############################Bang Employee############################
--Procedure Insert bang Employee
create procedure InsertEmployee
	@E_Id CHAR(6),
	@Firstname VARCHAR(20),
	@Lastname VARCHAR(20),
	@Qualification VARCHAR(30),
	@Birthday DATETIME,
	@Location INT,
	@LV_Id INT,
	@Status BIT     
	AS
	insert into Employee values(@E_Id,@Firstname,@Lastname,@Qualification,@Birthday,@Location,@LV_Id,@Status)

--Procedure Delete bang Employee
create procedure DeleteEmployee
	@E_Id CHAR(6)
	AS
	delete Employee where E_Id = @E_Id

--Procedure Select Employee by ID
create procedure SelectEmployee
	@E_Id CHAR(6)
	AS
	select * from Employee where E_Id = @E_Id

--Procedure Select Employee by FirstName
create procedure SelectEmployeebyFirstName
	@Firstname VARCHAR(20)
	AS
	select * from Employee where Firstname = @Firstname

--Procedure Select Employee by LastName
create procedure SelectEmployeebyLastName
	@LastName VARCHAR(20)
	AS
	select * from Employee where LastName = @LastName

--################################Bang Ticket############################
--Procedure Insert bang Ticket
create procedure InsertTicket
	@Price MONEY,
	@Cus_Id INT,
	@StartDate DATETIME,
	@Bus_number CHAR(5),
	@Rou_Id INT,
	@SeatNumber int,
	@Returnted BIT,
	@Status BIT
	AS
	insert into Ticket values(@Price,@Cus_Id,@StartDate,@Bus_number,@Rou_Id,@SeatNumber,@Returnted,@Status)

--Procedure Delete bang Ticket
create procedure DeleteTicket
	@T_Id INT
	AS
	delete Ticket where T_Id = @T_Id

--Procedure Select Ticket by ID
create procedure SelectTicket
	@T_Id INT
	AS
	select * from Ticket where T_Id = @T_Id

--Procedure Select Ticket by Price
create procedure SelectTicketbyPrice
	@Price MONEY
	AS
	select * from Ticket where Price = @Price

--############################Bang TicketReturn###########################
--Procedure Insert bang TicketReturn
create procedure InsertTicketReturn
	@TR_Id INT,
	@RetuneDate DATETIME,
	@Diminish INT,
	@ReturnPrice MONEY
	AS
	insert into TicketReturn values(@TR_Id,@RetuneDate,@Diminish,@ReturnPrice)

--Procedure Delete bang TicketReturn
create procedure DeleteTicketReturn
	@TR_Id INT
	AS
	delete TicketReturn where TR_Id = @TR_Id

--Procedure Select TicketReturn by ID
create procedure SelectTicketReturn
	@TR_Id INT
	AS
	select * from TicketReturn where TR_Id = @TR_Id

--#############################Bang NewAndEvent############################
--Procedure Insert bang NewAndEvent
create procedure InsertNewAndEvent
	@Title VARCHAR(100),
	@Content VARCHAR(100),
	@Author VARCHAR(100),
	@Date DATETIME,
	@Status bit 
	AS
	insert into NewAndEvent values(@Title,@Content,@Author,@Date,@Status)

--Procedure Delete bang NewAndEvent
create procedure DeleteNewAndEvent
	@NE_Id INT
	AS
	delete NewAndEvent where NE_Id = @NE_Id

--Procedure Select NewAndEvent by ID
create procedure SelectNewAndEvent
	@NE_Id INT
	AS
	select * from NewAndEvent where NE_Id = @NE_Id

--Procedure Select NewAndEvent by Title
create procedure SelectNewAndEventbyTitle
	@Title VARCHAR(100)
	AS
	select * from NewAndEvent where Title = @Title

--#############################Bang Admin##########################
--Procedure Insert bang Admin
create procedure InsertAdmin
	@UserName VARCHAR(30),
	@Pass VARCHAR(30),
	@FullName VARCHAR(100),
	@Address VARCHAR(100),
	@PhoneNumber VARCHAR(10)
	AS
	insert into Admin values(@UserName,@Pass,@FullName,@Address,@PhoneNumber)

--Procedure Delete bang Admin
create procedure DeleteAdmin
	@A_Id INT
	AS
	delete Admin where A_Id = @A_Id

--Procedure Select Admin by ID
create procedure SelectAdmin
	@A_Id INT
	AS
	select * from Admin where A_Id = @A_Id

--Procedure Select Admin by UserName
create procedure SelectAdminbyUserName
	@UserName INT
	AS
	select * from Admin where UserName = @UserName