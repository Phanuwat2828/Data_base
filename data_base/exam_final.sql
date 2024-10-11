-- 1. msp_demo1 (@year, @shop_name) 
-- แสดง รหัสออเดอร์ รหัสลูกค้า ชื่อลูกค้า วันที่ซื้อ ยอดการซื้อของออเดอร์นั้น และ ชื่อร้ำนค้ำ 
-- โดยแสดงเฉพำะออเดอร์ในปี @year   จากร้านชื่อ @shop_name


create procedure msp_demo1 
    @year varchar(4),
    @shop_name varchar(100)
as 
begin 
    select *
    