

-- create view demo_view3(cusid, year, total_discount, total_buy) 
-- as
--     select cusid,
--             year(odate),
--             sum(discount_point),
--             sum(final_price)
--     from orders
--     group by cusid,year(odate)




-- ! drop view demo_view3

create procedure msp_demo3 
    @year varchar(4)
as 
begin 
    select cid,
            name,
            demo_view3.year,
            total_discount,
            total_buy
    from customer,demo_view3
    where customer.cid = demo_view3.cusid
    and demo_view3.year = @year 
end


exec msp_demo3 '2020'
