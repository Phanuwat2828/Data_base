
create procedure msp_demo8
    @year varchar(4),
    @shopid varchar(4)
as 
begin 
    select month(odate),
            year(odate),
            sum(amount)
    from orders,order_detail
    where orders.oid = order_detail.oid
    and year(odate) = @year
    and orders.shopid = @shopid
    group by year(odate),month(odate)

end
exec msp_demo8 '2020','s02'