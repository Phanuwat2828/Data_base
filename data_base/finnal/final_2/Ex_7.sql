



create procedure msp_demo7 
    @year varchar(4),
    @shop_name varchar(100)
as 
begin 
    if(@shop_name is not null)
        begin 
            select oid ,
                shop.sid ,
                datediff(day,odate,fdate) as day,
                year(odate),
                shop.name
            from orders,shop 
            where orders.shopid = shop.sid
            and year(odate) = @year 
            and shop.name = @shop_name
            order by day desc

        end 
    else 
        begin 
            select oid ,
                shop.sid ,
                datediff(day,odate,fdate) as day,
                year(odate),
                shop.name
            from orders,shop 
            where orders.shopid = shop.sid
            and year(odate) = @year 
            order by shop.name desc,day desc
        end
end


exec msp_demo7 '2020',null