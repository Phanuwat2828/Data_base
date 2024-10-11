


create procedure  msp_search_customer
    @cid varchar(100),
    @name varchar(100),
    @phone varchar(10)
as 
begin 

    if(@cid is not null)
        begin 
            select *
            from customer 
            where cid = @cid
        end 

    else if(@name is not null)
        begin 
            select *
            from customer 
            where name like '%'+@name+'%'
        end
    else 
        begin 
            select *
            from customer 
            where phone = @phone
        end
end

-- drop procedure msp_search_customer


exec msp_search_customer 'c07','j',null

