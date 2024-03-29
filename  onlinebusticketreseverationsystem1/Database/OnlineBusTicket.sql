
--IF DB_ID('OnlineBusTicket') is NOT NULL
--DROP DATABASE OnlineBusTicket
--GO
CREATE DATABASE OnlineBusTicket
GO
USE OnlineBusTicket
GO
CREATE TABLE BusType
(
	BT_Id INT  PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(30) NOT NULL,         --Tên dịch vụ (Express,Luxury,Volvo...)
	[Description] VARCHAR(1000)NOT NULL, --Mô tả về loại xe
	Price MONEY NOT NULL,                --Giá của loại xe	
	[Status] BIT                         --Tình trạng hoạt động
)
GO
create TABLE City 
(

	Ci_Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL 
)
go
CREATE TABLE [Route] --Tuyến Đường
(
	Rou_Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(100) NOT NULL,      --Tên tuyến đường(Điểm đầu - Điểm cuối)(--Thêm mới_V1)
	StartPlace VARCHAR(50) NOT NULL,   --Điểm bắt đầu
	EndPlace VARCHAR(50) NOT NULL,     --Điểm kết thúc
	Distance INT NOT NULL,		       --Khoảng cách								
	StartDate DATETIME NOT NULL,       --Ngày mở tuyến đường
	Price MONEY NOT NULL,              --Giá của tuyến đường	
	[Description] VARCHAR(200)NOT NULL,--Giới thiệu về tuyến đường
	[Status] BIT                       --Tình trạng mở tuyến đường (Mở hay chưa)
)
GO
CREATE TABLE Parking_Place --Bến đỗ xe----
(
	PP_Id INT  PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL,                           --Tên bến đỗ xe
	Ci_Id INT FOREIGN KEY REFERENCES City(Ci_Id) NOT NULL, --Điểm đỗ thuộc TP nào?(--Thêm mới_V1)
	[Status] BIT                                           --Tình trạng của bến đỗ (có đặt xe hay không)
)
GO
CREATE TABLE TimeSlot
(
	TS_Id INT PRIMARY KEY IDENTITY(1,1),
	StartDate DATETIME NOT NULL,		--Ngày xe chạy(Ngày khách hàng đặt vé) 
	StartTime VARCHAR(20) NOT NULL,     --Giờ xuất phát
	EndTime VARCHAR(20) NOT NULL,       --Giờ đến
	EspectedTime VARCHAR(30)NOT NULL    --Thời gian dự tính
)

GO
CREATE TABLE Bus
(
	Bus_number CHAR(5) PRIMARY KEY,  --Yêu cầu 5 ký tự      
	Seat INT NOT NULL ,			     --Tổng số ghế của xe			
	BT_Id  INT FOREIGN KEY REFERENCES BusType(BT_Id) NOT NULL,
	[Status] BIT                     --Tình trạng sử dụng (xe chạy hay chưa)
)
GO
CREATE TABLE [Plan] 
(
	Rou_Id INT FOREIGN KEY REFERENCES [Route](Rou_Id) NOT NULL,
	PP_Id INT FOREIGN KEY REFERENCES Parking_Place(PP_Id) NOT NULL,
	Bus_Number CHAR(5) FOREIGN KEY REFERENCES Bus(Bus_Number) NOT NULL,
	TS_Id INT FOREIGN KEY REFERENCES TimeSlot(TS_Id) NOT NULL,
	PRIMARY KEY (Rou_Id,PP_Id,Bus_Number,TS_Id)
	
)
GO
CREATE TABLE Sales --Giảm giá
(
	Sa_Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL, --Người già,trẻ em
	MinAge INT NOT NULL,         --Tuối nhỏ nhất từ ..    
	MaxAge INT NOT NULL,         --.. Đến tuổi lớn nhất
	Rate INT NOT NULL,			 --% giảm giá
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
	RegisterDate DATETIME NOT NULL,	 --Ngày đăng ký chuyến đi	
	PhoneNumber VARCHAR(10)NOT NULL, --Số đt khách hàng
	Sa_Id INT FOREIGN KEY REFERENCES Sales(Sa_Id) NOT NULL,
	[Status] BIT                     --Tình trạng duy trì tài khoản 
)
GO
CREATE TABLE Branch
(
	B_id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(100) NOT NULL,     --Tên chi nhánh
	PhoneNumber VARCHAR(10) NOT NULL, --Số điện thoại của chi nhánh
	[Address] VARCHAR(100)NOT NULL,   --Địa chỉ của chi nhánh
	[Status] BIT                      --Tình trạng còn tồn tại hay ko
)
GO
CREATE TABLE Level_Authority
(
	LV_Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL, --VD:Quản lý Bus,Quản lý khách hàng..
	[Status] BIT                 --Quyền có được áp dụng hay ko
)
GO
CREATE TABLE Employee
(
	E_Id CHAR(6) PRIMARY KEY,
	Firstname VARCHAR(20) NOT NULL,      --Họ
	Lastname VARCHAR(20) NOT NULL,       --Tên
	UserName VARCHAR(30) NOT NULL,       --Tên đăng nhập
	Pass VARCHAR(30) NOT NULL,           --Mật khẩu
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
	Rou_Id INT FOREIGN KEY REFERENCES [Route]([Rou_Id]),      --Lấy tên tuyến đường(Điểm bắt đầu,Điểm kết thúc)
	SeatNumber INT NOT NULL,								  --Số ghế của khách hàng						
	[Return] BIT NOT NULL,									  --Tình trạng vé bị trả lại
	[Status] BIT DEFAULT(0)                                   --Tình trạng phát hành vé cho khách hàng
)

GO
CREATE TABLE DIMINISH
(
	DI_Id int primary key identity(1,1),
	DayNumberBefor int not null,               --Số ngày quy định triết khấu
	DiminishPercent int						   --% triết khấu	
)
GO
CREATE TABLE TicketReturn
(
	TR_Id INT FOREIGN KEY REFERENCES Ticket(T_Id) unique,     --Set ID của vé bị trả lại
	RetuneDate DATETIME NOT NULL,                             --Ngày trả lại vé
	DI_Id INT FOREIGN KEY REFERENCES DIMINISH(DI_Id) NOT NULL,--% Triết khấu
	ReturnPrice MONEY                                         --Số tiền sau khi triết khấu (tiền còn lại)
)
GO

CREATE TABLE NewAndEvent
(
	NE_Id INT PRIMARY KEY IDENTITY(1,1), 
	Title VARCHAR(100)NOT NULL,     --Tiêu đề tin tức
	[Content] VARCHAR(1000)NOT NULL,--Nội dung
	Author VARCHAR(100)NOT NULL,    --Tác giả
	Date DATETIME NOT NULL,         --Ngày đăng
	[Status] BIT                    --Tình trạng đăng tin
)
GO
CREATE TABLE [Admin]
(
	A_Id INT PRIMARY KEY IDENTITY(1,1), 
	UserName VARCHAR(30) NOT NULL,  --Tên đăng nhập
	Pass VARCHAR(30) NOT NULL,      --Mật khẩu
	FullName VARCHAR(100)NOT NULL,  --Tên đầy đủ
	[Address] VARCHAR(100)NOT NULL, --Địa chỉ
	PhoneNumber VARCHAR(10)NOT NULL,--Số điện thoại
)