


create trigger tg_checkProductPrice20Percent
on product
for update as 
begin 
    if update(price)
        begin 
            update product 
            set price = inserted.price
            from product
            join inserted on product.pid = inserted.pid 
            join deleted on product.pid = deleted.pid 
            where inserted.price <= deleted.price*1.2

            if exists(
                select *
                from inserted
                join deleted on inserted.pid = inserted.pid
                where inserted.price > deleted.price*1.2
            )
                begin 
                    print('Hello')
                end
            
        end
end


    
drop trigger tg_checkProductPrice20Percent

select *
from shop

update product 
set price = price*1.4