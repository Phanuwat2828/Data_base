



create trigger  tg_ProductNoDiscount
on product 
for update as 
begin 
    

    if update(price)
        begin 
            declare 
                @oldprice float,
                @newprice float,
                @ms_error varchar(255)

            select @oldprice  = price from deleted
            select @newprice = price from inserted

            if(@newprice<@oldprice)
                begin 
                    select @ms_error = 'update ไม่สำเร็จ '+cast(@newprice as varchar(50))+'<'+cast(@oldprice as varchar(50))
                    raiserror(@ms_error,16,1)
                    ROLLBACK transaction
                end 
            else 
                begin 
                    print('successfully update')
                end
        end 
end


update product 
set price = price-1.2
where pid = 'p06'