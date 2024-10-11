-- select *
-- from shop


create trigger tg_ProductNoDiscount
on product
for update as 
begin 
    declare @oldprice float,
        @newprice float,
        @error_ms varchar(255)


    if update(price)
        begin 
            select @oldprice = price from deleted
            select @newprice = price from inserted
            if(@newprice < @oldprice)
                begin
                    select @error_ms = 'แก้ไขไม่สำเร็จ: ราคาใหม่ ' + CAST(@newprice AS VARCHAR(50)) + ' น้อยกว่าราคาเดิม ' + CAST(@oldprice AS VARCHAR(50));
                    raiserror(@error_ms,16,1);
                    rollback transaction 
                end 
        end
end

drop trigger tg_ProductNoDiscount
        
update product 
set price = price-1.2
where pid = 'p01'

select *
from product