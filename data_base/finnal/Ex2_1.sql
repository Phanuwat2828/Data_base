
-- SELECT cid INTO CustomerPhoneLog FROM customer WHERE 1 = 0;

-- select *
-- from CustomerPhoneLog

-- alter table CustomerPhoneLog
-- add oldphone varchar(10),
-- newphoe varchar(10),
-- changedate date

-- sp_rename 'CustomerPhoneLog.cid' , 'cusid' , 'column'

-- • sp_rename '<TableName>, '<newTableName>'
-- • sp_rename 'SECTION' , 'COURSE'

-- sp_rename '<TableName>.<column>' , '<newColumn>', 'COLUMN'
-- • sp_rename 'STUDENT.major' , 'department', 'COLUMN'
-- • sp_rename 'LECTURER.salary', 'income', 'COLUMN'




create trigger  tg_customerPhoneLog 
on customer 
for update as 
begin 
    declare @oldphone varchar(10)

    select @oldphone = phone from deleted
    
    insert into CustomerPhoneLog 
        select inserted.cid,@oldphone,inserted.phone,getdate()
        from inserted
end

update customer 
set phone = '0897'
where cid = 'c03'


select *
from CustomerPhoneLog