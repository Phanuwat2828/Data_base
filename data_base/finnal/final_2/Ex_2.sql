


create procedure msp_demo2 
    @year varchar(4),
    @shop_name varchar(100)
as
begin 
    if(@year is null)
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
            and shop.name = @shop_name
        end
    else 
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
end

-- !drop procedure msp_demo2


exec msp_demo2 null,'pdrink'