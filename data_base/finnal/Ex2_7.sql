
create trigger  tg_bonusSuggestedCustomera
on customer 
for insert as 
begin 

    declare 
        @invite_ varchar(5),
        @total_point int

    select @invite_ = suggestedid from inserted

    if(@invite_ is not null)
        begin
            update customer 
            set point  += 10
            where cid = @invite_
            print('id:'+@invite_)
            select @total_point = point 
            from customer
            where cid  = @invite_
            print('totalpoint : ' + cast(@total_point as varchar(50)))
        end
end

drop trigger tg_bonusSuggestedCustomera

insert into CUSTOMER values('c97', 'Killua', null, null, '7-7-2000', 0, 'c05')
