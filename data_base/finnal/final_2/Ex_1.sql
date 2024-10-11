
-- หัสออเดอร์ รหัสลูกค้า ชื่อลูกค้า วันที่ซื้อ ยอดการซื้อของออเดอร์นั้น และ ชื่อร้ำนค้ำ 

create procedure msp_demo1
    @year varchar(4),
    @shop_name varchar(100)
as 
begin 
    select oid,
            customer.cid,
            customer.name,
            odate,
            final_price,
            shop.name
    from orders,customer,shop 
    where orders.cusid = customer.cid 
    and orders.shopid = shop.sid
    and year(odate) = @year
    and shop.name = @shop_name
end
select *
from orders

-- ! drop procedure msp_demo1

exec msp_demo1 '2020', 'pDrink'