-----insert Bustype------- Hung
USE OnlineBusTicket
GO	
execute InsertBusType 'Express','Loai Xe Hang Trung','50000','1'
execute InsertBusType 'Luxury','Loai Xe Hang Sang','100000','1'
execute InsertBusType 'Volvo','Loai Xe Hang Cao Cap','150000','1'
execute InsertBusType 'Express','Loai xe Hang Trung','50000','1'
select * from BusType
-----UpdateBusTypeByID------- Hung
execute UpdateBusTypeByID '1','ExpressX','Xe Duoi Hang Trung','40000','1'
execute UpdateBusTypeByID '2','Luxury','Xe Duoi Hang Sang','90000','0'
execute UpdateBusTypeByID '3','Volvo','Xe Tren Hang Cao Cap','160000','1'
execute UpdateBusTypeByID '4','ExpressS','Xe Tren Hang Trung','55000','0'

-----UpdateBusTypeByName------- Hung

execute UpdateBusTypeByName 'ExpressX','Xe Duoi Hang Trung','40000','1'
execute UpdateBusTypeByName 'Luxury','Xe Duoi Hang Sang','90000','0'
execute UpdateBusTypeByName 'Volvo','Xe Tren Hang Cao Cap','160000','1'
execute UpdateBusTypeByName 'ExpressS','Xe Tren Hang Trung','55000','0'

-----delete DeleteBusTypeByID------- Hung
execute deleteBusType '1'
execute deleteBusType '2'
execute deleteBusType '3'
execute deleteBusType '4'

-----delete DeleteBusTypeByName------- Hung
execute DeleteBusTypeByName 'ExpressX'
execute DeleteBusTypeByName 'Luxury'
execute DeleteBusTypeByName 'Volvo'
execute DeleteBusTypeByName 'ExpressS'


-----insert Packing_Place------- Hung

execute InsertPacking_Place 'MiDinh','1',1
execute InsertPacking_Place 'LongBien','1',1
execute InsertPacking_Place 'GiaLam','1',1
execute InsertPacking_Place 'NuocNgam','1',1




-----update UpdatePacking_PlaceByID------- Hung

execute UpdatePacking_PlaceByID '1','MiDinh1','','0'
execute UpdatePacking_PlaceByID '2','LongBien1','','1'
execute UpdatePacking_PlaceByID '3','GiaLam2','','1'
execute UpdatePacking_PlaceByID '4','NuocNgam3','','0'

-----update UpdatePacking_PlaceByName------- Hung

execute UpdatePacking_PlaceByName 'MiDinh1','','0'
execute UpdatePacking_PlaceByName 'LongBien1','','1'
execute UpdatePacking_PlaceByName 'GiaLam2','','1'
execute UpdatePacking_PlaceByName 'NuocNgam3','','0'

-----delete DeletePacking_PlaceByID------- Hung
execute DeletePacking_PlaceByID '1'
execute DeletePacking_PlaceByID '2'
execute DeletePacking_PlaceByID '3'
execute DeletePacking_PlaceByID '4'

-----delete DeletePacking_PlaceByName------- Hung
execute DeletePacking_PlaceByID 'MiDinh1'
execute DeletePacking_PlaceByID 'LongBien1'
execute DeletePacking_PlaceByID 'GiaLam2'
execute DeletePacking_PlaceByID 'NuocNgam3'


-----insert Sales------- Hung
execute InsertSales 'Tre','1','7','100','1'
execute InsertSales 'Vua','8','12','30','1'
execute InsertSales 'Lon','13','50','0','1'
execute InsertSales 'Gia','51','100','50','1'

-----update Sales------- Hung

execute UpdateSalesByID '1','Tre','1','7','100','1'
execute UpdateSalesByID '2','Vua','8','12','30','0'
execute UpdateSalesByID '3','Lon','13','50','0','1'
execute UpdateSalesByID '4','Gia','51','100','50','0'

-----update Sales------- Hung

execute UpdateSalesByName 'Tre','1','7','100','1'
execute UpdateSalesByName 'Vua','8','12','30','0'
execute UpdateSalesByName 'Lon','13','50','0','1'
execute UpdateSalesByName 'Gia','51','100','50','0'

-----delete DeleteSalesByID------- Hung

execute DeleteSalesByID '1','Tre'
execute DeleteSalesByID '2','Vua'
execute DeleteSalesByID '3','Lon'
execute DeleteSalesByID '4','Gia'

-----delete DeleteSalesByID------- Hung

execute DeleteSalesByName 'Tre'
execute DeleteSalesByName 'Vua'
execute DeleteSalesByName 'Lon'
execute DeleteSalesByName 'Gia'

---- insert City -------
execute InsertCity N'An Giang'
execute InsertCity N'Bắc Giang'
execute InsertCity N'Bắc Ninh'
execute InsertCity N'Bắc Cạn'
execute InsertCity N'Bạc Liêu'
execute InsertCity N'Bến Tre'
execute InsertCity N'Nam Định'
execute InsertCity N'Bình Phước'
execute InsertCity N'Bà Rịa-Vũng Tàu'
execute InsertCity N'Bình Dương'
execute InsertCity N'Bình Thuận'
execute InsertCity N'Cần Thơ'
execute InsertCity N'Cà Mau'
execute InsertCity N'Cao Bằng'
execute InsertCity N'Đắk Lắk'
execute InsertCity N'Đồng Tháp'
execute InsertCity N'Đồng Nai'
execute InsertCity N'Đắk Nông'
execute InsertCity N'Gia Lai'
execute InsertCity N'Hà Nội'
execute InsertCity N'Hưng Yên'
execute InsertCity N'Hải Phòng'
execute InsertCity N'Hà Nam'
execute InsertCity N'Hải Dương'
execute InsertCity N'Hậu Giang'
execute InsertCity N'Hòa Bình'
execute InsertCity N'Hà Giang'
execute InsertCity N'Thành phố Hồ Chí Minh'
execute InsertCity N'Kiên Giang'
execute InsertCity N'Kon Tum'
execute InsertCity N'Khánh Hòa'
execute InsertCity N'Lào Cai'
execute InsertCity N'Long An'
execute InsertCity N'Lâm Đồng'
execute InsertCity N'Lạng Sơn'
execute InsertCity N'Nam Định'
execute InsertCity N'Nghệ An'
execute InsertCity N'Ninh Thuận'
execute InsertCity N'Ninh Bình'
execute InsertCity N'Phú Yên'
execute InsertCity N'Phú Thọ'
execute InsertCity N'Quảng Nam'
execute InsertCity N'Quảng Ngãi'
execute InsertCity N'Quảng Trị'
execute InsertCity N'Quảng Bình'
execute InsertCity N'Quảng Ninh'
execute InsertCity N'Sơn La'
execute InsertCity N'Sóc Trăng'
execute InsertCity N'Thái Bình'
execute InsertCity N'Thừa Thiên-Huế'
execute InsertCity N'Thanh Hóa'
execute InsertCity N'Tuyên Quang'
execute InsertCity N'Trà Vinh'
execute InsertCity N'Tiền Giang'
execute InsertCity N'Thái Nguyên'
execute InsertCity N'Tây Ninh'
execute InsertCity N'Vĩnh Phúc'
execute InsertCity N'Vĩnh Long'
execute InsertCity N'Yên Bái'



