
-- Stored procedure


-- 1. [msp_young_students ]     แสดง sid, name, major, age ของนิสิตทุกคนที่อายุอยู่ในช่วง xx ถึง yy ปี





create procedure msp_young__student
	@first int ,
	@last int 
as
	select student.sid,
			student.name,
			student.major,
			datediff(year,birthday,getdate())
	from 	student
	where 	datediff(year,birthday,getdate()) >= @first
	and 	datediff(year,birthday,getdate()) <= @last


-- =====================================================

EXEC msp_young__student 17,19



--  2. [msp_any_sub_students ] แสดง sid, name, term, grade ของนิสิตทเคยเรียนวิชาชื่อ xx


create procedure msp_any_sub_students
    @subject_Name varchar(20)
as
    select student.sid,
            student.name,
            section.term,
            enroll.grade 
    from student,enroll,section,subject 
    where student.sid = enroll.stdid
    and enroll.secid = section.secid
    and section.subid = subject.sid
    and SUBJECT.name = @subject_Name
-- ==================================================================

exec msp_any_sub_students 'programming'


--  3. [msp_major_grade_students ] แสดงจำนวนนิสิตในภาควิชา xx ทไดgpa สูงกวา yy
    
    create procedure msp_major_grade_students
            @major_one varchar(6),
            @major_two varchar(6)
    as
        select count(*)
        from student
        where major = @major_one
        and gpa > (
            select max(gpa)
            from student
            where major = @major_two
        )
-- ==========================================================================

    exec msp_major_grade_students 'cs','py'
    
    


--  4. [msp_delete_subject]เพื่อลบขอมูลวิชาทไมเคยเปดสอนเลย

create procedure msp_delete_subject

as
        DELETE
        from subject
        where sid not in (
            select subid 
            from section
        )

-- =========================================

exec msp_delete_subject



--  5. [msp_enro l_report]เพื่อแสดงรายละเอียดการลงทะเบียนเรียนในเทอม xx  โดยแสดง secid, subid และ จำนวนนิสิตทลงเรียนใน secid นั้น

create procedure msp_enro_l_report
    @term varchar(10)
as 
    select SECTION.secid,
            subid,
            count(stdid) as amount
    from enroll,section
    where enroll.secid = section.secid
    and term = @term
    group by SECTION.secid,subid

-- ===============================================================

exec msp_enro_l_report '1-2020'

--  6. [msp_increase_salary_a] เพื่อเพิ่มเงินเดือนใหอาจารยภาควิชา xx โดยเพิ่ม yy %
    
    create procedure msp_increase_salary_a
        @major varchar(6),
        @percent float
    as
        update lecturer
        set salary += salary*(float)(@percent/100)
        where major = @major

-- ==============================================================

exec msp_increase_salary_a 'cs',5


--  7. [msp_increse_salary_b] yearเพื่อเพิ่มเงินเดือนใหอาจารยโดยเพิ่มตามจำนวนวิชาทสอนในปนั้น ๆมการรับ parameter 2 ตัว คือคือ ปทตองการใหเพิ่มเงินเดือนmoneyคือ จำนวนเงินทเพิ่มขึ้นตามวิชาทสอนในปนั้น ๆ เชน msp_increase_salary_b 2021 3000 หมายถึง เพิ่มเงินเดือนใหอาจารยทสอนป2021 วิชาละ 3000 บาทmsp_increase_salary_b 2022 1000 หมายถึง เพิ่มเงินเดือนใหอาจารยทสอนป2022 วิชาละ 1000 บาท*หมายเหต* ควรสราง View เพื่อเช็ควาแตละปอาจายสอนกวิชา เชน TeachByYear (lecid, year, amount)

-- =======================================================================
create view TeachByYear (lecid, year, amount) as 
        select lecid,
                substring(term,3,4),
                count(*)
        from lecturer,section 
        where lecturer.lid = section.lecid
        group by lecid,substring(term,3,4)

create procedure msp_increse_salary_b
    @year_enter varchar(10),
    @money_add int
as
    update lecturer
    set salary += (amount*@money_add)
    from TeachByYear
    where lecturer.lid = TeachByYear.lecid
    and year = @year_enter
-- =======================================================================

EXEC msp_increse_salary_b '2020',100


 -- 8. [msp_increase_salary_c] เพิ่มเงินเดือนอาจารยโดยมการรับ parameter 3 ตัวคือ
-- • mid_sal
 --• i1
-- • i2
 --คือคาเงินเดือนทเปนตัวแบงการคำนวณ
 --คือเปอรเซ็นตการขึ้นเงินเดือนถาอาจารยเงินเดือน < mid_sal
 --คือเปอรเซ็นตการขึ้นเงินเดือนถาอาจารยเงินเดือน >= mid_sal
 --* นั่นคือ อาจารยแตละคนจะไดเงินเดือนขึ้นเปอรเซ็นตไมเทากัน ขึ้นอยกับเงินเดือนเดิมของอาจาร



 create procedure msp_increase_salary_c 
		@mid_sal  int,
		@i1     float,
		@i2     float

as 
		update lecturer 
		set salary += (case 
						when salary>=@mid_sal then @i2
						when salary<@mid_sal then @i1
						end )/100*salary

--========================================================
exec msp_increase_salary_c 20000,2,4

-- 9

	create table  Student_Prize(
		stdid varchar(6),
		term varchar(7),
		a_amount int,
		total_prize int,
		cdate date,
		db_user varchar(10)
	)
	
	
