-- drop procedure  msp_demo1

create procedure  msp_demo1
    @year varchar(4),
    @shop_name varchar(100)
as 
begin 
    select oid,
            cusid,
            customer.name,
            odate,
            final_price,
            shop.name
    from orders,customer,shop
    where orders.cusid = customer.cid
    and orders.shopid = shop.sid
    and year(orders.odate) = @year
    and shop.name = @shop_name
end

select YEAR(odate)
from orders




