-----insert Bustype------- Hung

execute insertBusType 'Express','Loai Xe Hang Trung','50000','1'
execute insertBusType 'Luxury','Loai Xe Hang Sang','100000','1'
execute insertBusType 'Volvo','Loai Xe Hang Cao Cap','150000','1'
execute insertBusType 'Express','Loai xe Hang Trung','50000','1'

-----update Bustype------- Hung
execute updateBusType '1','ExpressX','Xe Duoi Hang Trung','40000','1'
execute updateBusType '2','Luxury','Xe Duoi Hang Sang','90000','0'
execute updateBusType '3','Volvo','Xe Tren Hang Cao Cap','160000','1'
execute updateBusType '4','ExpressS','Xe Tren Hang Trung','55000','0'

-----delete Bustype------- Hung
execute deleteBusType '1','ExpressX'
execute deleteBusType '2','Luxury'
execute deleteBusType '3','Volvo'
execute deleteBusType '4','ExpressS'

-----insert Packing_Place------- Hung

execute insertPacking_Place 'MiDinh','1'
execute insertPacking_Place 'LongBien','1'
execute insertPacking_Place 'GiaLam','1'
execute insertPacking_Place 'NuocNgam','1'


-----update Packing_Place------- Hung

execute updatePacking_Place '1','MiDinh1','0'
execute updatePacking_Place '2','LongBien1','1'
execute updatePacking_Place '3','GiaLam2','1'
execute updatePacking_Place '4','NuocNgam3','0'

-----delete Packing_Place------- Hung

execute deletePacking_Place '1','MiDinh1'
execute deletePacking_Place '2','LongBien1'
execute deletePacking_Place '3','GiaLam2'
execute deletePacking_Place '4','NuocNgam3'

-----insert Sales------- Hung

execute insertSales 'Tre','1','7','100','1'
execute insertSales 'Vua','8','12','30','1'
execute insertSales 'Lon','13','50','0','1'
execute insertSales 'Gia','51','100','50','1'

-----update Sales------- Hung

execute updateSales '1','Tre','1','7','100','1'
execute updateSales '2','Vua','8','12','30','0'
execute updateSales '3','Lon','13','50','0','1'
execute updateSales '4','Gia','51','100','50','0'

-----delete Sales------- Hung

execute deleteSales '1','Tre'
execute deleteSales '2','Vua'
execute deleteSales '3','Lon'
execute deleteSales '4','Gia'


