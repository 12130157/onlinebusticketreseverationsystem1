USE OnlineBusTicket
GO	
/*                                                             BASIC PROCEDURE                                                             */

/*******************Table Bustype************************
1.Insert */
IF OBJECTPROPERTY(object_id('InsertBusTpye'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].InsertBusTpye
GO
CREATE PROCEDURE InsertBusTpye
@Name VARCHAR(30),
@Desciption VARCHAR(1000)
AS
INSERT INTO BusType VALUES(@Name,@Desciption,1)
GO

/*2. Update by ID*/
IF OBJECTPROPERTY(object_id('UpdateBusTypeByID'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].UpdateBusTypeByID
GO
CREATE PROCEDURE UpdateBusTypeByID
@BT_ID INT,
@Name VARCHAR(30)
AS
UPDATE BusType SET Name=@Name WHERE BT_Id=@BT_ID
GO
/*3. DELETE BY ID*/
IF OBJECTPROPERTY(object_id('DeleteBusTypeByID'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].DeleteBusTypeByID
GO
CREATE PROCEDURE DeleteBusTypeByID
@BT_ID INT
AS
DELETE BusType WHERE BT_Id=@BT_ID
GO
/*4. SELECT BY ID*/
IF OBJECTPROPERTY(object_id('SelectBusTypeByID'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectBusTypeByID
GO
CREATE PROCEDURE SelectBusTypeByID
@BT_ID INT
AS
SELECT     *    FROM    BusType WHERE BT_Id=@BT_ID
GO
/*5. SELECT BY NAME*/
IF OBJECTPROPERTY(object_id('SelectBusTypeByName'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectBusTypeByName
GO
CREATE PROCEDURE SelectBusTypeByName
@Name VARCHAR(30)
AS
SELECT     *    FROM    BusType WHERE [Name]=@Name
GO
/*6. SELECT ALL */
IF OBJECTPROPERTY(object_id('SelectAllBusType'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectAllBusType
GO
CREATE PROCEDURE SelectAllBusType
AS
SELECT     *    FROM    BusType
GO

/*******************Table Packing_Place************************/
/*1. Insert */
IF OBJECTPROPERTY(object_id('InsertPacking_Place'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].InsertPacking_Place
GO
CREATE PROCEDURE InsertPacking_Place
@Name VARCHAR(30)
AS
INSERT INTO Packing_Place VALUES(@Name,1)
GO
/*2. Update by ID*/
IF OBJECTPROPERTY(object_id('UpdatePacking_PlaceByID'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].UpdatePacking_PlaceByID
GO

CREATE PROCEDURE UpdatePacking_PlaceByID
@PP_Id INT,
@Name VARCHAR(30)
AS
UPDATE Packing_Place SET Name=@Name WHERE PP_Id=@PP_Id
GO
/*3. DELETE BY ID*/
IF OBJECTPROPERTY(object_id('DeletePacking_PlaceByID'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].DeletePacking_PlaceByID
GO

CREATE PROCEDURE DeletePacking_PlaceByID
@PP_Id INT
AS
DELETE Packing_Place WHERE PP_Id=@PP_Id
GO
/*4. SELECT BY ID*/
IF OBJECTPROPERTY(object_id('SelectPacking_PlaceByID'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectPacking_PlaceByID
GO
CREATE PROCEDURE SelectPacking_PlaceByID
@PP_Id INT
AS
SELECT     *    FROM    Packing_Place WHERE PP_Id=@PP_Id
GO
/*5. SELECT BY NAME*/
IF OBJECTPROPERTY(object_id('SelectPacking_PlaceByName'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectPacking_PlaceByName
GO
CREATE PROCEDURE SelectPacking_PlaceByName
@Name VARCHAR(30)
AS
SELECT     *    FROM    Packing_Place WHERE [Name]=@Name
GO
/*6. SELECT ALL */
IF OBJECTPROPERTY(object_id('SelectAllPacking_Place'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectAllPacking_Place
GO
CREATE PROCEDURE SelectAllPacking_Place
AS
SELECT     *    FROM    Packing_Place
GO
/*******************Table Level_Authority************************/
/*1. Insert */
IF OBJECTPROPERTY(object_id('InsertLevel_Authority'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].InsertLevel_Authority
GO

CREATE PROCEDURE InsertLevel_Authority
@Name VARCHAR(30)
AS
INSERT INTO Level_Authority VALUES(@Name,1)
GO
/*2. Update by ID*/
IF OBJECTPROPERTY(object_id('UpdateLevel_AuthorityByID'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].UpdateLevel_AuthorityByID
GO

CREATE PROCEDURE UpdateLevel_AuthorityByID
@LV_Id INT,
@Name VARCHAR(30)
AS
UPDATE Level_Authority SET Name=@Name WHERE LV_Id=@LV_Id
GO
/*3. DELETE BY ID*/
IF OBJECTPROPERTY(object_id('DeleteLevel_AuthorityByID'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].DeleteLevel_AuthorityByID
GO
CREATE PROCEDURE DeleteLevel_AuthorityByID
@LV_Id INT
AS
DELETE Level_Authority WHERE LV_Id=@LV_Id
GO
/*4. SELECT BY ID*/
IF OBJECTPROPERTY(object_id('SelectLevel_AuthorityByID'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectLevel_AuthorityByID
GO
CREATE PROCEDURE SelectLevel_AuthorityByID
@LV_Id INT
AS
SELECT     *    FROM    Level_Authority WHERE LV_Id=@LV_Id
GO
/*5. SELECT BY NAME*/
IF OBJECTPROPERTY(object_id('SelectLevel_AuthorityByName'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectLevel_AuthorityByName
GO
CREATE PROCEDURE SelectLevel_AuthorityByName
@Name VARCHAR(30)
AS
SELECT     *    FROM    Level_Authority WHERE [Name]=@Name
GO
/*6. SELECT ALL */
IF OBJECTPROPERTY(object_id('SelectAllLevel_Authority'), N'IsProcedure') = 1
DROP PROCEDURE [dbo].SelectAllLevel_Authority
GO
CREATE PROCEDURE SelectAllLevel_Authority
AS
SELECT     *    FROM    Level_Authority

