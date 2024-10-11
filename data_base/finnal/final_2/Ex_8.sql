



create procedure msp_demo8 
    @year varchar(4),
    @shopid varchar(10)
as 
begin 
    select month(odate),
            year(odate),
            sum(final_price)
    from orders
    where year(odate) = @year
    and shopid = @shopid
    group by month(odate),year(odate)
end

-- ! drop procedure msp_demo8


exec msp_demo8 '2020','s01'


