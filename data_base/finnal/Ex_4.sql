

-- create view demo_view4(shopid, year , total_sell) as 
--     select shopid,
--             YEAR(odate) as year ,
--             sum(final_price) as total_sell
--     from orders
--     group by shopid,year(odate)


create procedure msp_demo4 
    @year varchar(4),
    @seller_name varchar(100)
as 
begin 
    select seller.sid,
            shop.name,
            demo_view4.year,
            total_sell
    from seller,shop,demo_view4
    where seller.sid = shop.sellerid
    and shop.sid = demo_view4.shopid
    and demo_view4.year = @year
    and seller.name = @seller_name 
end

-- ! drop procedure msp_demo4

exec msp_demo4 '2022', 'WARP'



   