
create procedure   msp_search_customer
    @cid varchar(4),
    @name varchar(100),
    @phone varchar(10)
as 
begin 
    if(@cid is not null)
        select *
        from customer
        where cid = @cid
    else if(@phone is not null)
        select *
        from customer
        where phone = @phone
    else 
        select *
        from customer
        where name like @name+'%'
end

exec msp_search_customer 'c07','j',null