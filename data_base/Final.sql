


--  ============== Join Table ============== 

-- 1.แสดงรหัสนิสิต และชื่อนิสิตที่เคยเรียนวิชา CS001

select sid,
        name 
from student,enroll,section 
where student.sid = enroll.stdid 
and enroll.secid = section.secid
and subid = 'cs001'


-- 2.แสดงรหัสนิสิต และชื่อนิสิตที่เคยเรียนวิชา Programming

select student.sid,
        student.name  
from student,enroll,section,subject
where student.sid = enroll.stdid 
and enroll.secid = section.secid
and section.subid = subject.sid
and subject.name = 'programming'

-- 3.แสดงรหัสนิสิต และชื่อนิสิตที่เคยเรียนกับอาจารย์ชื่อ Peter Parker

select student.sid,
        student.name  
from student,enroll,section,lecturer
where student.sid = enroll.stdid 
and enroll.secid = section.secid
and section.lecid = lecturer.lid
and lecturer.name = 'Peter Parker'


-- 4.แสดง รหัสนิสิต ที่ได้เกรด A วิชา Programming

select stdid
from enroll,section,subject 
where enroll.secid = section.secid
and section.subid = subject.sid
and enroll.grade = 'A'
and subject.name = 'programming'

-- 5.แสดง รหัสนิสิต และชื่อนิสิต ที่ได้เกรด A วิชา Programming


select student.sid,
        student.name
from student,enroll,section,subject
where student.sid = enroll.stdid
and enroll.secid = section.secid
and section.subid = subject.sid
and enroll.grade = 'A'
and subject.name = 'programming'


-- 6.แสดงรหัสนิสิต ชื่อนิสิต และเกรดที่ได้ ของนิสิตที่เรียน section id 6 

select sid,
        name,
        grade 
from student,enroll 
where student.sid = enroll.stdid 
and enroll.secid = '6'


-- 7.แสดงรหัสนิสิต ชื่อนิสิต และเกรดที่ได้ ของนิสิตที่เรียนวิชา Database ในเทอม 1-2020

select student.sid,
        student.name,
        grade 
from student,enroll,section,subject
where student.sid = enroll.stdid 
and enroll.secid = section.secid
and section.subid = subject.sid 
and section.term = '1-2020'
and subject.name = 'database'


-- 14.แสดงรหัสวิชา และชื่อวิชาที่เป็น pre-requisite ของวิชา AI
    
    
    select sub2.name,
            sub2.sid
    from subject sub1, subject sub2
    where sub1.prerequisite = sub2.sid
    and sub1.name = 'AI'


-- 15.แสดงรหัสวิชา และชื่อวิชาของทุกวิชาที่มีวิชา programming เป็น pre-requisite

select sub1.name
from subject sub1 ,subject sub2 
where sub1.prerequisite = sub2.sid
and sub2.name = 'programming'


-- ================= Outer Join ==============

-- 16.แสดงชื่ออาจารย์และเทอมที่สอน ของอาจารย์ทุกคน รวมทั้งอาจารย์ที่ไม่เคยสอนเลย

select lecturer.name,term
from lecturer left outer join section 
ON  lecturer.lid = SECTION.lecid


-- 17.แสดงชื่ออาจารย์ ชื่อวิชาที่สอน และเทอมที่สอน ของอาจารย์ทุกคน รวมทั้งอาจารย์ที่ไม่เคยสอนเลย

select lecturer.name,
        isnull(subject.name,'ไม่มีวิชา'),
        isnull(section.term,'ไม่มีวิชา')
from lecturer left outer join section 
on lecturer.lid = section.lecid
    left outer join subject 
on section.subid = subject.sid


-- 18.แสดงรหัสนิสิต และรหัสวิชาที่ลงทะเบียนเรียน ของนิสิตทุกคน รวมทั้งคนที่ไม่เคยลงทะเบียนเรียนเลย


select student.sid,
        section.subid
from student left outer join enroll
on student.sid = enroll.stdid
    left outer join section 
on enroll.secid = section.secid

-- 19.แสดงรหัสนิสิต ชื่อวิชาเทอมที่เรียน เกรดที่ได้ ของนิสิตทุกคน รวมทั้งคนที่ไม่เคยลงทะเบียนเรียนเลย


select student.sid,
        subject.name,
        section.term,
        enroll.grade
from student left outer join enroll
on student.sid = enroll.stdid
    left outer join section 
on enroll.secid = section.secid
    left outer join subject 
on section.subid = subject.sid


-- ================ INTERSECT, EXCEPT,  UNION ==============


-- 1.แสดงรหัสนิสิต และชื่อนิสิตของนิสิตที่เคยเรียนทั้งวิชา cs001 และ cs002

select student.sid,
        student.name 
from student,enroll,section 
where student.sid = enroll.stdid 
and enroll.secid = section.secid 
and section.subid = 'cs001'
intersect 
select student.sid,
        student.name 
from student,enroll,section 
where student.sid = enroll.stdid 
and enroll.secid = section.secid 
and section.subid = 'cs002'

-- 2.แสดงรหัสนิสิต และชื่อนิสิตของนิสิตที่เคยเรียนวิชา cs001 แต่ไม่เคยเรียน cs002

select student.sid,
        student.name 
from student,enroll,section 
where student.sid = enroll.stdid 
and enroll.secid = section.secid 
and section.subid = 'cs001'
except
select student.sid,
        student.name 
from student,enroll,section 
where student.sid = enroll.stdid 
and enroll.secid = section.secid 
and section.subid = 'cs002'

-- 3.แสดง ชื่อ, สาขา ของอาจารย์ที่สอนในเทอม 1-2020 แต่ไม่ได้สอนเทอม 2-2020

select lecturer.name,
        lecturer.major
from lecturer,section 
where lecturer.lid = section.lecid
and section.term = '1-2020'
EXCEPT
select lecturer.name,
        lecturer.major
from lecturer,section 
where lecturer.lid = section.lecid
and section.term = '2-2020'

-- 4.แสดง ชื่อ, ปีเกิด, อายุ ของนิสิตที่อายุน้อยที่สุด และอายุมากที่สุด

select name,
        year(birthday) as birthday,
        DATEDIFF(year,birthday,getdate()) as age
from student 
where DATEDIFF(year,birthday,getdate()) = (
        select min(DATEDIFF(year,birthday,GETDATE())) as age
        from student
)
UNION
select name,
        year(birthday) as birthday,
        DATEDIFF(year,birthday,getdate()) as age
from student 
where DATEDIFF(year,birthday,getdate()) = (
        select max(DATEDIFF(year,birthday,GETDATE())) as age
        from student
)

-- 5.แสดง ชื่อ, ปีเกิด, อายุ ของนิสิตที่อายุน้อยที่สุด และอายุมากที่สุดใน major CS



select name,
        year(birthday) as birthday,
        DATEDIFF(year,birthday,getdate()) as age
from student 
where DATEDIFF(year,birthday,getdate()) = (
        select  min(datediff(year,birthday,getdate()))
        from student
        where major = 'cs'
        group by major
)
and major = 'cs'
UNION
select name,
        year(birthday) as birthday,
        DATEDIFF(year,birthday,getdate()) as age
from student 
where DATEDIFF(year,birthday,getdate()) = (
        select  max(datediff(year,birthday,getdate()))
        from student
        where major = 'cs'
        group by major
)
and major = 'cs'


-- 6.แสดงข้อมูลของนิสิตสาขา CS ที่ไม่เคยเรียนวิชา Programming เลย

select student.name,
        student.sid
from student,enroll,section,subject 
where student.sid = enroll.stdid 
and enroll.secid = section.secid
and section.subid = subject.sid
and major = 'cs'
except 
select student.name,
        student.sid
from student,enroll,section,subject 
where student.sid = enroll.stdid 
and enroll.secid = section.secid
and section.subid = subject.sid
and student.major = 'cs'
and subject.name = 'programming'

--  ================== Nested Join Statement ================


-- 1.แสดงรหัสวิชาและ ชื่อวิชา ที่ไม่เคยเปิดสอนเลย

select sid,
        name 
from subject 
where sid not in (
        select subid 
        from section
)



-- ================= Group by order by exits ==================
