

create trigger tg_checkProductPointForDiscount
on order_detail
for insert as 
begin 
    declare 
        @max_point int,
        @pid_ varchar(4),
        @use_point int
    
    select @pid_ = pid from inserted

    select @use_point = use_point from inserted

    select @max_point = max_point 
    from product 
    where pid = @pid_
    
    if(@use_point > @max_point )
        begin 
            raiserror('cant insert becase you use point %d > %d',16,1,@use_point,@max_point)
            rollback transaction
        end
    else 
        begin
            raiserror('successfully insert',16,1)
        end
end

drop trigger tg_checkProductPointForDiscount

insert into order_detail(oid, pid, amount, use_point) values(10, 'p06', 1, 10000)

