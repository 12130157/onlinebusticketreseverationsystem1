
--IF DB_ID('OnlineBusTicket') is not null
--DROP DATABASE OnlineBusTicket
--GO
CREATE DATABASE OnlineBusTicket
GO
USE OnlineBusTicket
GO
CREATE TABLE BusType
(
	BT_Id INT  PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(30) NOT NULL, --Tên dịch vụ (Express,Luxury,Volvo...)
	[Description] varchar(1000), --Mô tả về loại xe
	Price money not null,        --Giá của loại xe	
	[Status] BIT                 --Tình trạng hoạt động
)
GO
create table City 
(

	Ci_Id int PRIMARY KEY IDENTITY(1,1),
	[Name] varchar(50) not null 
)
go
CREATE TABLE [Route] --Tuyến Đường
(
	Rou_Id INT PRIMARY KEY IDENTITY(1,1),
	StartPlace varchar(50) not null, --Điểm bắt đầu
	EndPlace varchar(50) not null,   --Điểm kết thúc
	Distance int,					 --Khoảng cách								
	StartDate datetime,              --Ngày mở tuyến đường
	Price money not null,            --Giá của tuyến đường	
	[Description] varchar(200),      --Giới thiệu về tuyến đường
	[Status] BIT                     --Tình trạng mở tuyến đường (Mở hay chưa)
)
GO
CREATE TABLE Packing_Place --Bến đỗ xe
(
	PP_Id INT  PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL, --Tên bến đỗ xe
	[Status] BIT                 --Tình trạng của bến đỗ (có đặt xe hay không)
)
GO
CREATE TABLE Bus
(
	Bus_number CHAR(5) PRIMARY KEY, --Yêu cầu 5 ký tự
	StartTime DATETIME NOT NULL,    --Giờ xuất phát
	EndTime DATETIME NOT NULL,      --Giờ đến 
	EspectedTime VARCHAR(30),		--Thời gian dự tính	
	Seat INT not null ,			    --Tổng số ghế của xe			
	BT_Id  INT FOREIGN KEY REFERENCES BusType(BT_Id) NOT NULL,
	Rou_Id INT FOREIGN KEY REFERENCES [Route](Rou_Id) NOT NULL,
	PP_Id INT FOREIGN KEY REFERENCES Packing_Place(PP_Id) NOT NULL,
	[Status] BIT                    --Tình trạng sử dụng
)
GO
CREATE TABLE Sales --Giảm giá
(
	Sa_Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL, --Người già,trẻ em
	MinAge INT,                  --Tuối nhỏ nhất từ ..    
	MaxAge INT,                  --.. Đến tuổi lớn nhất
	Rate INT ,					 --% giảm giá
	[Status] BIT                 --Tình trạng có áp dụng hay không 
)
GO
CREATE TABLE Customers
(
	Cus_Id INT PRIMARY KEY IDENTITY(1,1),
	
	FirstName VARCHAR(50) NOT NULL,  --Họ
	LastName VARCHAR(50) NOT NULL,   --Tên
	Birthday DATETIME NOT NULL,      --Ngày ,tháng ,năm sinh
	[Address] VARCHAR(100) NOT NULL, --Địa chỉ khách hàng
	Email VARCHAR(50) NOT NULL,      --Email khách hàng
	RegisterDate DATETIME NOT NULL,	
	PhoneNumber VARCHAR(10),         --Số đt khách hàng
	Sa_Id INT FOREIGN KEY REFERENCES Sales(Sa_Id) NOT NULL,
	[Status] BIT                     --Tình trạng duy trì tài khoản 
)
GO
CREATE TABLE Branch
(
	B_id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(100) NOT NULL,     --Tên chi nhánh
	PhoneNumber VARCHAR(10) NOT NULL, --Số điện thoại của chi nhánh
	[Address] VARCHAR(100),           --Địa chỉ của chi nhánh
	[Status] BIT                      --Tình trạng còn tồn tại hay ko
)
GO
CREATE TABLE Level_Authority
(
	LV_Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL, --VD:Quản lý Bus,Quản lý khách hàng
	[Status] BIT                 --Quyền có được áp dụng hay ko
)
GO
CREATE TABLE Employee
(
	E_Id CHAR(6) PRIMARY KEY,
	Firstname VARCHAR(20) NOT NULL,      --Họ
	Lastname VARCHAR(20) NOT NULL,       --Tên
	Qualification VARCHAR(30) NOT NULL,  --Trình độ
	Birthday DATETIME NOT NULL,          --Ngày,tháng,năm sinh
	Location INT FOREIGN KEY REFERENCES Branch(B_id),
	LV_Id INT FOREIGN KEY REFERENCES level_Authority(LV_Id),
	[Status] BIT                         --Tình trạng duy trì tài khoản  
)
GO
CREATE TABLE Ticket
(
	T_Id INT PRIMARY KEY IDENTITY(1,1),
	Price MONEY NOT NULL,                                     --Giá phải trả (Đã tính toán) 
	Cus_Id INT FOREIGN KEY REFERENCES Customers(Cus_Id),      --Lấy tên khách hàng
	StartDate DATETIME NOT NULL,                              --Ngày xe chạy(Ngày khách hàng đặt vé) 
	Bus_number CHAR(5) FOREIGN KEY REFERENCES Bus(Bus_number),--Lấy 2 trường BusNumber,Stardate
	Rou_Id INT FOREIGN KEY REFERENCES [Route]([Rou_Id]),      --Lấy tên tuyến đường
	SeatNumber int not null,								  --Số ghế của khách hàng						
	Returnted BIT  ,                                          --Tình trạng vé bị trả lại
	[Status] BIT DEFAULT(0)                                   --Tình trạng phát hành vé cho khách hàng
)
GO
CREATE TABLE TicketReturn
(
	TR_Id INT FOREIGN KEY REFERENCES Ticket(T_Id) unique, --Set ID của vé bị trả lại
	RetuneDate DATETIME NOT NULL,                         --Ngày trả lại vé
	Diminish INT,                                         --% Triết khấu
	ReturnPrice MONEY                                     --Số tiền sau khi triết khấu (tiền còn lại)
)
GO

CREATE TABLE NewAndEvent
(
	NE_Id INT PRIMARY KEY IDENTITY(1,1), 
	Title VARCHAR(100),            --Tên đăng nhập
	[Content] VARCHAR(100),        --Mật khẩu
	Author VARCHAR(100),           --Tác giả
	Date DATETIME,                 --Ngày đăng
)
GO
CREATE TABLE [Admin]
(
	A_Id INT PRIMARY KEY IDENTITY(1,1), 
	UserName VARCHAR(30) NOT NULL, --Tên đăng nhập
	Pass VARCHAR(30) NOT NULL,     --Mật khẩu
	FullName VARCHAR(100),         --Tên đầy đủ
	[Address] VARCHAR(100),        --Địa chỉ
	PhoneNumber VARCHAR(10),	   --Số điện thoại
)