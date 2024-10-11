


-- SELECT cid INTO CustomerPhoneLog FROM customer WHERE 1 = 0

-- alter table CustomerPhoneLog
-- add oldphone varchar(10),
-- newphone varchar(10),
-- changedate date

-- sp_rename 'CustomerPhoneLog.cid' , 'cusid' ,'column'

-- drop table CustomerPhoneLog

-- select *
-- from CustomerPhoneLog

-- sp_help CustomerPhoneLog


create trigger tg_customerPhoneLog
on customer 
for update as
begin 
    declare 
        @oldphone varchar(10),
        @newphone varchar(10)
    
    if update(phone)
        select @oldphone = phone from deleted
        select @newphone = phone from inserted

        insert into CustomerPhoneLog 
                select inserted.cid,@oldphone,@newphone,getdate()
                from inserted
    
end




update customer 
set phone = '0981'
where cid = 'c01'

select *
from CustomerPhoneLog