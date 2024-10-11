

create trigger tg_increaseCustomerPointAfterOrders
on orders
for insert as 
begin  
    declare 
        @total_money int,
        @add_point int,
        @total_point int,
        @cid varchar(4)
    
    select @total_money = final_price from inserted
    select @cid = cusid from inserted
    select @add_point = @total_money/100
    
    update customer 
    set point += @add_point
    where cid = @cid

    select @total_point = point 
    from customer
    where cid = @cid
    
    print('total monney '+cast(@total_money as varchar(50)));
    print('add_point '+cast(@add_point as varchar(50)));
    print('total point '+cast(@total_point as varchar(50)));
end

drop trigger  tg_increaseCustomerPointAfterOrders 
select * from orders