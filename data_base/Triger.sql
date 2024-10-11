--  1. [tg_Lecurer_Start_date] ทุกครั้งทมการ insert ขอมูลลงใน table Lecturer ใหเก็บขอมูลลงใน table
--  Lecturer_StartDate_History
-- table: Lecturer_StartDate_History (lid, startdate, db_user) โดยเป็นข้อมูล
-- รหัสอาจารย์ , วันที่ที่เริ่มงาน และ dbuser ที่ insert ข้อมูลของอาจารย์ 

    create trigger tg_Lecurer_Start_date 
    on lecturer
    for insert as 
    begin 
        insert into Lecturer_StartDate_History
            select lid,getdate(),suser_name()
            from inserted
    end

    insert LECTURER VALUES('t12','LeckRock',100,'CS')
    SELECT lid INTO Lecturer_StartDate_History FROM lecturer WHERE 1 = 0;

    
    alter table Lecturer_StartDate_History
    add startdate date,
        db_user VARCHAR(30)
    
    select *
    from Lecturer_StartDate_History

    drop trigger tg_Lecurer_Start_date
    drop table Lecturer_StartDate_History

--  2. [tg_Lecturer_Change_Salary ] ทุกครั้งทมการเปลี่ยนแปลงเงินเดือนอาจารยใหเก็บขอมูลลงใน table
--  Lecurer_Salary_History
--  table: Lecurer_Salary_History (lid, xrate, nrate, cdate ) โดย
--  lid
--  รหัสอาจารย
--  xrate เงินเดือนเดิม
--  nrate เงินเดือนใหม
--  cdate ทมการเปลี่ยนแปลง
--  ** หมายเหต** ตองใชการทำงานของ CURSOR ในขอนเพราะถาเราใชการ declare variable ธรรมดา เมื่อม
--  การ update ขอมูลหลาย record จะทำใหtrigger ทำงานไมถูกตอง เชน
--  updatelecturer
--  set
--  salary = 40000
--  where major = ‘cs

    create trigger tg_Lecturer_Change_Salary 
    on Lecturer
    for update as 
    begin 
        DECLARE @nsalary int 
        DECLARE cur cursor for 
        select salary from updated
        open cur
    end 

    select lid INTO Lecurer_Salary_History from lecturer where 1=0;

    alter table Lecurer_Salary_History
    add  xrate int,
        nrate int,
        cdate date



   
