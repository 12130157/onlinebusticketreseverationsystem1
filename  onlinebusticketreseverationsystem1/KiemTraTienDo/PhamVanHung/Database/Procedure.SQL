USE OnlineBusTicket
GO	--sao cai go nay lai mau den nhi?
--------Insert Update Delete Bustype-------Hung
IF OBJECTPROPERTY(object_id('SelectAllBusType'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectAllBusType
go
CREATE PROCEDURE SelectAllBusType
as
begin 
	SELECT * FROM BusType
end
go
IF OBJECTPROPERTY(object_id('SelectBusTypeByID'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectBusTypeByID
go
CREATE PROCEDURE SelectBusTypeByID
(	
	@BT_Id INT
)
as
begin select * from BusType where BT_Id =@BT_Id
end
go
IF OBJECTPROPERTY(object_id('SelectBusTypeByName'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectBusTypeByName
go
CREATE PROCEDURE SelectBusTypeByName
(	
	@Name VARCHAR(30)
)
as
begin select * from BusType where [Name] =@Name
end

go
IF OBJECTPROPERTY(object_id('InsertBusType'), N'IsProcedure') = 1
DROP procedure [dbo].InsertBusType
go
CREATE procedure InsertBusType
(	
	@Name VARCHAR(30), --Tên dịch vụ (Express,Luxury,Volvo...)
	@Description varchar(1000), --Mô tả về loại xe
	@Price money,        --Giá của loại xe	
	@Status BIT                 --Tình trạng hoạt động
)
as
begin
insert into BusType([Name],[Description],Price,[Status]) values (@Name,@Description,@Price,@Status)
end

go
IF OBJECTPROPERTY(object_id('UpdateBusTypeByID'),N'IsProcedure') = 1
DROP procedure [dbo].UpdateBusTypeByID
go
CREATE procedure UpdateBusTypeByID
(
	@BT_Id INT,
	@Name VARCHAR(30), --Tên dịch vụ (Express,Luxury,Volvo...)
	@Description varchar(1000), --Mô tả về loại xe
	@Price money,        --Giá của loại xe	
	@Status BIT                 --Tình trạng hoạt động
)
as
begin
update BusType set [Name]=@Name,[Description]=@Description,Price=@Price,[Status]=@Status where BT_Id =@BT_Id
end
go
IF OBJECTPROPERTY(object_id('UpdateBusTypeByName'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].UpdateBusTypeByName
go
CREATE procedure UpdateBusTypeByName
(
	@Name VARCHAR(30), --Tên dịch vụ (Express,Luxury,Volvo...)
	@Description varchar(1000), --Mô tả về loại xe
	@Price money,        --Giá của loại xe	
	@Status BIT                 --Tình trạng hoạt động
)
as
begin
update BusType set [Name]=@Name,[Description]=@Description,Price=@Price,[Status]=@Status where [Name] =@Name
end
go
IF OBJECTPROPERTY(object_id('DeleteBusTypeByID'),N'IsProcedure') = 1
DROP procedure [dbo].DeleteBusTypeByID
go
CREATE procedure DeleteBusTypeByID
(
	@BT_Id INT	
)
as
begin
delete from Bustype where BT_Id=@BT_Id
end
go
IF OBJECTPROPERTY(object_id('DeleteBusTypeByName'),N'IsProcedure') = 1
DROP procedure [dbo].DeleteBusTypeByName
go
CREATE procedure DeleteBusTypeByName
(	
	@Name VARCHAR(30) --Tên dịch vụ (Express,Luxury,Volvo...)	
)
as
begin
delete from Bustype where [Name]=@Name
end

--------Insert Update Delete Parking_Place-------Hung
select * from Parking_Place
go
IF OBJECTPROPERTY(object_id('InsertParking_Place'),N'IsProcedure') = 1
DROP procedure [dbo].InsertParking_Place
go
CREATE procedure InsertParking_Place --Bến đỗ xe
(	
	@Name VARCHAR(50), --Tên bến đỗ xe
	@Ci_Id int,
	@Status BIT    --Tình trạng của bến đỗ (có đặt xe hay không)
)
as
begin
insert into Parking_Place values(@Name,@Ci_Id,@Status)
end
go
IF OBJECTPROPERTY(object_id('SelectParking_PlaceByID'),N'IsProcedure') = 1
DROP procedure [dbo].SelectParking_PlaceByID
go
CREATE procedure SelectParking_PlaceByID --Bến đỗ xe
(	
	@PP_Id INT
)
as
begin
select * from Parking_Place where PP_Id=@PP_Id
end
go
IF OBJECTPROPERTY(object_id('SelectParking_PlaceByName'),N'IsProcedure') = 1
DROP procedure [dbo].SelectParking_PlaceByName
go
CREATE procedure SelectParking_PlaceByName --Bến đỗ xe
(	
	@Name VARCHAR(50)
)
as
begin
select * from Parking_Place where [Name]=@Name
end
go
IF OBJECTPROPERTY(object_id('SelectAllParking_Place'),N'IsProcedure') = 1
DROP procedure [dbo].SelectAllParking_Place
go
CREATE procedure SelectAllParking_Place --Bến đỗ xe
as
begin
select * from Parking_Place
end
go
IF OBJECTPROPERTY(object_id('UpdateParking_PlaceByID'),N'IsProcedure') = 1
DROP procedure [dbo].UpdateParking_PlaceByID
go
CREATE procedure UpdateParking_PlaceByID --Bến đỗ xe
(	
	@PP_Id INT,
	@Name VARCHAR(50), --Tên bến đỗ xe
	@Ci_Id int,
	@Status BIT    --Tình trạng của bến đỗ (có đặt xe hay không)
)
as
begin
update Parking_Place set [Name]=@Name,Ci_Id=@Ci_Id,Status=@Status where PP_Id=@PP_Id
end
go
IF OBJECTPROPERTY(object_id('UpdateParking_PlaceByName'),N'IsProcedure') = 1
DROP procedure [dbo].UpdateParking_PlaceByName
go
CREATE procedure UpdateParking_PlaceByName --Bến đỗ xe
(	
	@Name VARCHAR(50), --Tên bến đỗ xe
	@Ci_Id int,
	@Status BIT    --Tình trạng của bến đỗ (có đặt xe hay không)
)
as
begin
update Parking_Place set [Name]=@Name,Ci_Id=@Ci_Id,Status=@Status where [Name]=@Name
end
go
IF OBJECTPROPERTY(object_id('DeleteParking_PlaceByID'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].DeleteParking_PlaceByID
go
CREATE procedure DeleteParking_PlaceByID
(
	@PP_Id INT	
)
as
begin
delete from Parking_Place where PP_Id=@PP_Id 
end	
go
IF OBJECTPROPERTY(object_id('DeleteParking_PlaceByName'),N'IsProcedure') = 1
DROP PROCEDURE DeleteParking_PlaceByName
go
CREATE procedure DeleteParking_PlaceByName
(
	@Name VARCHAR(50)
)
as
begin
delete from Parking_Place where [Name]=@Name 
end	
--------Insert Update Delete Sales-------Hung
go
IF OBJECTPROPERTY(object_id('InsertSales'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].InsertSales
go
CREATE procedure InsertSales --Giảm giá
(	
	@Name VARCHAR(50), --Người già,trẻ em
	@MinAge INT,                  --Tuối nhỏ nhất từ ..    
	@MaxAge INT,                  --.. Đến tuổi lớn nhất
	@Rate INT ,					 --% giảm giá
	@Status BIT                 --Tình trạng có áp dụng hay không 
)
as
begin
insert into Sales([Name],MinAge,MaxAge,Rate,[Status]) values (@Name,@MinAge,@MaxAge,@Rate,@Status)
end
go
IF OBJECTPROPERTY(object_id('UpdateSalesByID'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].UpdateSalesByID
go
CREATE procedure UpdateSalesByID
(	
	@Sa_Id INT,
	@Name VARCHAR(50), --Người già,trẻ em
	@MinAge INT,                  --Tuối nhỏ nhất từ ..    
	@MaxAge INT,                  --.. Đến tuổi lớn nhất
	@Rate INT ,					 --% giảm giá
	@Status BIT                 --Tình trạng có áp dụng hay không 
)
as
begin
update Sales set [Name]=@Name,MinAge=MinAge,MaxAge=MaxAge,Rate=@Rate,[Status]=@Status where Sa_Id=@Sa_Id
end
go
IF OBJECTPROPERTY(object_id('UpdateSalesByName'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].UpdateSalesByName
go
CREATE procedure UpdateSalesByName
(	
	@Name VARCHAR(50), --Người già,trẻ em
	@MinAge INT,                  --Tuối nhỏ nhất từ ..    
	@MaxAge INT,                  --.. Đến tuổi lớn nhất
	@Rate INT ,					 --% giảm giá
	@Status BIT                 --Tình trạng có áp dụng hay không 
)
as
begin
update Sales set [Name]=@Name,MinAge=MinAge,MaxAge=MaxAge,Rate=@Rate,[Status]=@Status where [Name]=@Name
end
go
IF OBJECTPROPERTY(object_id('DeleteSalesByID'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].DeleteSalesByID
go
CREATE procedure DeleteSalesByID
(	
	@Sa_Id INT	
)
as
begin
delete from Sales where Sa_Id=@Sa_Id
end
go
IF OBJECTPROPERTY(object_id('DeleteSalesByName'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].DeleteSalesByName
go
CREATE procedure DeleteSalesByName
(	
	@Name VARCHAR(50)--Người già,trẻ em	
)
as
begin
delete from Sales where [Name]=@Name
end
go
IF OBJECTPROPERTY(object_id('SelectSalesByName'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectSalesByName
go
CREATE procedure SelectSalesByName
(	
	@Name VARCHAR(50)--Người già,trẻ em	
)
as
begin
select * from Sales where [Name]=@Name
end
go
IF OBJECTPROPERTY(object_id('SelectSalesByID'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectSalesByID
go
CREATE procedure SelectSalesByID
(	
	@Sa_Id INT
)
as
begin
select * from Sales where Sa_Id=@Sa_Id
end
go
IF OBJECTPROPERTY(object_id('SelectAllSales'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectAllSales
go
CREATE procedure SelectAllSales
as
begin
select * from Sales
end

---------- Insert Update Delete Select City ---------- Hung
go
IF OBJECTPROPERTY(object_id('SelectAllCity'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectAllCity
go
CREATE procedure SelectAllCity
as
begin
select * from City
end
go
IF OBJECTPROPERTY(object_id('SelectCityByID'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectCityByID
go
CREATE procedure SelectCityByID
(
	@Ci_Id int
	
)
as
begin
select * from City where Ci_Id=@Ci_Id
end
go
IF OBJECTPROPERTY(object_id('SelectCityByName'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectCityByName
go
CREATE procedure SelectCityByName
(
	@Name varchar(50)
)
as
begin
select * from Sales where [Name]=@Name
end

go
IF OBJECTPROPERTY(object_id('InsertCity'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].InsertCity
go
CREATE PROCEDURE InsertCity
(
	@Name varchar(50)
)
as begin
insert into City([Name]) values(@Name)
end
go
IF OBJECTPROPERTY(object_id('UpdateCityByID'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].UpdateCityByID
go
CREATE PROCEDURE UpdateCityByID
(
	@Ci_Id int,
	@Name varchar(50)
)
as begin
update City set [Name] = @Name where Ci_Id=@Ci_Id
end

go
IF OBJECTPROPERTY(object_id('UpdateCityByName'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].UpdateCityByName
go
CREATE PROCEDURE UpdateCityByName
(	
	@Name varchar(50)
)
as begin
update City set [Name] = @Name where [Name] = @Name
end
go
IF OBJECTPROPERTY(object_id('DeleteCityByID'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].DeleteCityByID
go
CREATE PROCEDURE DeleteCityByID
(	
	@Ci_Id int	
)
as begin
delete from City where Ci_Id = @Ci_Id
end
go
IF OBJECTPROPERTY(object_id('DeleteCityByName'),N'IsProcedure') = 1
DROP PROCEDURE [dbo].DeleteCityByName
go
CREATE PROCEDURE DeleteCityByName
(	
	@Name varchar(50)
)
as begin
delete from City where [Name] = @Name
end