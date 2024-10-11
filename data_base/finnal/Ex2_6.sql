

create trigger  tg_checkShopStatus
on orders
for insert as 
begin 
    declare 
        @shopid_ varchar(5),
        @status_ int 
    

    select @shopid_ = shopid from inserted
    select @status_ = status 
    from shop 
    where sid = @shopid_

    if(@status_ != 1)
        begin 
            raiserror('you cant buy shop over here it is close',16,1)
            ROLLBACK transaction
        end
    else 
        begin 
            print('successfully Orders')
        end
END

select *
from orders

insert into orders(oid, cusid, shopid, final_price) values (706, 'c02', 's02', 250) 