use OnlineBusTicket

exec InsertBusType 'Hai Au','40 cho',30000,1
exec InsertCity 'Hai Phong'
exec InsertRoute 'Ha Noi - Hai Phong','Ben xe Luong Yen','Cho Sat',80,'1/1/2010',30000,'SASS',1
exec InsertPacking_Place 'Ben xe Luong Yen',1,1
exec InsertBus 20192,'5:30','8:00','2h30p',40,1,1,1,1
exec InsertSales 'Tre em',0,5,2,1
exec InsertCustomers 'Bach','Trung','8/8/1990','39 Nguyen Cao','trungti_tp@yahoo.com','1/1/2010','0902080890',1,1
exec InsertBranch 'Sinh Cafe','043999999','6 Luong Ngoc Quyen',1
exec InsertLevel_Authority 'Admin',1
exec InsertEmployee 'c00097','Bach','Trung','trungbd','123456','University','8/8/1990',1,1,1
exec InsertTicket 30000,1,'1/1/2010',20192,1,1,1,1
exec InsertTicketReturn 1,'1/1/2010',1,25000
exec InsertNewAndEvent 'Giam gia nhan dip dai le','Giam 10%','TrungBD','1/10/2010',1
exec InsertAdmin 'trungbd','123456','Bach Duong Trung','39 Nguyen Cao','0902080890'