


create procedure msp_demo6 
    @year varchar(4),
    @amount int ,
    @precent float 
as 
begin 
    update product 
    set price -= price*(@precent/100) 
    where pid in (
        select order_detail.pid,year(odate)
        from order_detail,orders
        where orders.oid = order_detail.oid
        and year(odate) = @year
        group by pid,year(odate)
        having sum(amount) < @amount
    )
end



exec msp_demo6 '2020',99,0.1
