

create procedure msp_demo6 
    @year varchar(4),
    @amount int,
    @precent float
as 
begin 
    update product 
    set price -= price*(@precent/100)
    where pid in (
        select
            product.pid
        from order_detail,orders,product
        where orders.oid = order_detail.oid 
        and order_detail.pid = product.pid
        and year(odate) = @year
        group by product.pid , year(odate)
        having   sum(amount) < @amount
    )
end

exec msp_demo6 '2020',2,10
