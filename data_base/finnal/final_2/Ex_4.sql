

-- create view demo_view4(shopid, year , total_sell) as 
--     select shopid,
--             year(odate),
--             sum(final_price)
--     from orders
--     group by shopid,year(odate)


-- แสดงรหัสร้านค้า ชื่อร้านค้า ปี และ ยอดรวมการขายในปี @year ร้านที่เป็นของผู้ขำยชื่อ

create procedure  msp_demo4
    @year varchar(4),
    @seller_name varchar(100)
as 
begin 
    select shop.sid ,
            shop.name,
            demo_view4.year,
            demo_view4.total_sell,
            seller.name
    from seller,shop,demo_view4
    where shop.sid = demo_view4.shopid
    and shop.sellerid = seller.sid 
    and demo_view4.year = @year 
    and seller.name = @seller_name
end 

-- !drop procedure msp_demo4 


exec msp_demo4 '2020', 'prymania'