

create procedure msp_demo5 
    @year varchar(4)
as 
begin 
    update customer 
    set point += case
            when total_buy>50000 then 500
            when total_buy>20000 then 100
            when total_buy > 5000 then 20
            else                        0
        end
    from demo_view3
    where customer.cid = demo_view3.cusid
    and demo_view3.year = @year
end

-- ! drop procedure msp_demo5

exec msp_demo5 '2020'