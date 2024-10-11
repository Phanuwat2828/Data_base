
-- create view demo_view3(cusid, year, total_discount, total_buy) as 
--     select cusid,
--             year(odate),
--             sum(discount_point),
--             sum(final_price)
--     from orders
--     group by cusid,year(odate)



create procedure msp_demo3 
        @year VARCHAR(4)
as 
begin 
    select cusid,
            customer.name,
            total_discount,
            total_buy
    from customer,demo_view3
    where customer.cid = demo_view3.cusid 
    and demo_view3.year = @year
end
