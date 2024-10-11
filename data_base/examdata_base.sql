--1. แสดงชื่อ นศ และสาขา ของนักเรียนที่ชื่อไม่เป็นค่าว่าง


select name,
		major
from student
where name is not null


-- 2. แสดงชื่อ นศ และสาขา ของนักเรียนที่ชื่อและสาขาไม่เป็นค่าว่าง


select name,
		major
from student
where name is not null 
and major is not null


--3.แสดงชื่อ นศ และสาขา ของนักเรียนที่เรียนสาขา CS

select name,
		major
from student
where major = 'CS'



-- 4.แสดงชื่อ นศ และสาขา ของนักเรียนที่เรียนสาขา CS หรือ PY


select name,
		major
from student
where major in ('cs','py')



-- 5.แสดงชื่อ นศ และสาขา ของนักเรียนที่ไม่ได้เรียนสาขา CS, MA, PY

select name,
		major 
from student 
where major not in ('cs','py')

-- 6.แสดงชื่อ นศ และสาขา ของนักเรียนที่มีชื่อนำหน้าด้วย S

select name,
		major
from student 
where name like 's%'



--7.แสดงชื่อ นศ และสาขา ของนักเรียนที่มีชื่อนำหน้าด้วย K และลงท้ายด้วย A


select name,
		major
from student 
where name like 'k%a'

-- 8.แสดง นศ และ gpa ของนักเรียนที่มี gpa อยู่ระหว่าง 2.00 ถึง 3.00


select name,
		gpa
from student
where gpa > 2.0 
and gpa < 3.0



-- 9.แสดง นศ และ gpa ของนักเรียนที่ไม่ได้เรียน CS และ PY เรียงลำดับ gpa น้อยไปมาก


select name,
		gpa
from student
where major not in ('cs','py')
order by gpa asc

-- 10.แสดง นศ และ gpa ของนักเรียน เรียงลำดับ gpa น้อยไปมาก
select name,
		major,
		gpa
from	student 
where	major is not null
order by	gpa asc


-- 11.แสดง gpa สูงสุด และ ต่ำสุดของนักเรียนใน column max_gpa และ min_gpa

select max(gpa) as max,
		min(gpa) as min
from student

-- 12.แสดง gpa สูงสุด และ ต่ำสุด ของนักเรียนที่เรียนสาขา CS ใน column max_cs และ min_cs
select max(gpa) as max_gpa,
		min(gpa) as min_gpa
from student
where major in ('CS')


-- 13.แสดงวิชาที่เป็น prerequisite ของวิชา Graphics


select *
from subject
where prerequisite = 'CS005'


-- 14.แสดงวิชาและ prerequisite ของวิชาที่มี prerequisite
select sid,
		name
from subject
where prerequisite is not null


-- 15.วิชาที่มีหน่วยกิตมากกว่า 3 หน่วยกิตขึ้นไป
select *
from subject
where credit >=3



-- 16วิชาที่มี prerequisite เป็นวิชา CS001
select *
from subject
where prerequisite = ('CS001')

-- 17.วิชาที่มี prerequisite เป็นวิชา CS001 จำนวนทั้งหมด
select count(*) as amount
from subject
where prerequisite in ('CS001') 

-- 18.แสดงข้อมูลอาจารย์ที่มีเงินเดือนระหว่าง 20000 – 40000
select *
from lecturer
where salary >=20000 and salary <=40000



-- 19.อาจารย์ที่มีเงินเดือนสูงสุดและสอนวิชา CS
select max(salary) as Max_salary
from lecturer
where major in ('CS')

-- 20.อาจารย์ที่มีเงินเดือนเฉลี่ยสูงสุดและสอนวิชา English
select avg(salary) as Max_salary
from lecturer
where major in ('English')


-- 21.อาจารย์ที่สอนวิชา English และมีเงินเดือนน้อยกว่า 40000
select *
from lecturer
where major in ('English') and salary <40000


-- 22.แสดงข้อมูลอาจารย์ที่ไม่ได้สอนวิชา CS และ MIS
select *
from lecturer
where major not in ('CS','MIS')

-- 23.แสดงยอดรวมเงินเดือน เงินเดือนสูงสุด เงินเดือนต่ำสุด และเงินเดือนเฉลี่ยของอาจารย์
select sum(salary) as sum_salary,
		max(salary) as max_salary,
		min(salary) as min_salary,
		avg(salary) as avg_salary
from lecturer


-- 24.แสดงยอดรวมเงินเดือน เงินเดือนสูงสุด เงินเดือนต่ำสุด และเงินเดือนเฉลี่ยใน column total_salary, max_salary, min_salary และ average_salary


select sum(salary) as total_salary,
		max(salary) as max_salary,
		min(salary) as min_salary,
		avg(salary) as avg_salary
from lecturer


-- 25.แสดงยอดรวมเงินเดือน เงินเดือนสูงสุด เงินเดือนต่ำสุด และเงินเดือนเฉลี่ย ของอาจารย์ที่สอนวิชา English
--ใน column total_sal, max_sal, min_sal และ average_sal

select sum(salary) as total_salary,
		max(salary) as max_salary,
		min(salary) as min_salary,
		avg(salary) as avg_salary
from lecturer
where major in ('English')



-- 25.แสดงข้อมูลนักเรียนที่ลงทะเบียนวิชา CS001 ในเทอม 1-2020 
select *
from section
where subid in ('CS001') and term = '1-2020'
-- 26.วิชาและ section ของนักเรียนที่ลงทะเบียนวิชา CS001
select *
from section
where subid = 'CS001'

-- 27.ข้อมูล section ในเทอม 1-2021
select *
from section
where term = '1-2021'

--28.แสดงข้อมูล section ในปี 2020
select *
from section
where substring(term,3,4) = '2020'

-- 29.แสดง section id, subject id, lecturer id และเทอม ของข้อมูล section ในปี 2020
select secid,
		subid,
		lecid,
		term
from section
where substring(term,3,4) = '2020'

select term
from section

-- 30.แสดงวิชาที่เปิดในปี 2020 (ทั้ง 1-2020 และ 2-2020) โดยไม่ซ้ำกัน
select distinct subid
from section
where substring(term,3,4) = '2020'

--31.แสดงวิชาที่เปิดในปี 2020 และมีอาจารย์ lecid = 't01'
select distinct subid
from section
where substring(term,3,4) = '2020' 
and lecid = 't01'


-- 32.จำนวนวิชาที่สอนโดยอาจารย์ t02
select count(*) as amount
from section
where lecid = 't02'

-- 33.จำนวน section ของวิชา CS005
select count(*) as amount
from section
where subid = 'CS005'

-- 34.แสดงรหัสนักเรียนที่ได้เกรด A โดยไม่ซ้ำกัน
select distinct stdid
from enroll
where grade = 'A'

-- 35.แสดงรหัสนักเรียนที่ลงทะเบียนใน section id 5
select stdid
from  enroll
where secid = 5



-- 36.แสดงรหัสนักเรียนที่ลงทะเบียนใน section id 1 และได้เกรดที่ไม่ใช่ F
select stdid
from  enroll
where secid = 1 and grade != 'F'

-- 37.แสดงจำนวน นักเรียนที่ลงทะเบียนใน section 2 และได้เกรดที่ไม่ใช่ F
select count(*)
from  enroll
where secid = 2 and grade != 'F'

-- 38.แสดงจำนวนที่นักเรียนที่มีรหัสนักเรียน 60001 ได้ลงทะเบียน
select count(*)
from  enroll
where stdid = '60001'
-- 39.แสดงจำนวนที่นักเรียนที่มีรหัสนักเรียน 60006 ได้เกรด F
select count(*)
from  enroll
where grade = 'F'

-- 40.แสดงรหัสนักเรียน ชื่อ และวันเกิด ของนักเรียนที่เกิดปี 2005
select sid,
		name,
		birthday
from student
where datename(year,birthday) = '2005'

select sid,
		name,
		birthday
from student
where datename(weekday,birthday)= 'จันทร์'

-- 41.แสดงรหัสนักเรียน ชื่อ และวันเกิด ของนักเรียนที่อายุ 20 ปี
select sid,
		name,
		birthday
from student
where datediff(year,birthday,getdate()) = 20


-- 42.แสดงรหัสนักเรียน ชื่อ และวันเกิด ของนักเรียนที่เกิดเดือน September
select sid,
		name,
		birthday
from student
where datepart(month,birthday) = 9
-- 43. แสดงนักเรียนที่มีวันเกิดตรงกับวันพฤหัสบดี พร้อมด้วยรหัสนักเรียน ชื่อ วันเกิด และอายุ
select sid,
       name,
       birthday,
       datediff(year, birthday, getdate()) as age
from student
where datename(weekday, birthday) = 'พฤหัสบดี'




-- 44. แสดงรหัสนักเรียน ชื่อ วันเกิด และอายุของนักเรียนทุกคน
select sid,
       name,
       birthday,
       datediff(year, birthday, getdate()) as age
from student

-- 45. แสดงรหัสนักเรียน ชื่อ วันเกิด และอายุของนักเรียนที่มีอายุต่ำกว่า 20 ปีและไม่ใช่สาขา CS
select sid,
       name,
       birthday,
       datediff(year, birthday, getdate()) as age
from student
where datediff(year, birthday, getdate()) < 20 and major not in ('CS')

--ISNULL, TOP, Group by - having
-- 46.áÊ´§¢éÍÁÙÅ¢Í§¹ÔÊÔµ ·Õèä´é GPA ÊÙ§·ÕèÊØ´ã¹ major CS
select max(gpa) as gpa,
		sid,
		name
from student
group by major
having major = 'CS'

 --46. แสดงขอมูลของนิสิต ทไดGPA สูงที่สุดใน major CS

 select top 1 *
 from student 
 where major = 'cs'
 order by gpa desc


 -- 47. แสดงขอมูลของอาจารยทเงินเดือนนอยที่สุด 2 คน

 select distinct *
 from lecturer

 select top 1*
 from lecturer
 order by salary asc

 --48. แสดงรหัสอาจารยและจำนวนครั้งทเคยสอน
 
 select *
 from section


select lecid,
		count(*) as amount
from section
group by lecid

 --49. แสดงรหัสอาจารยและจำนวนครั้งทเคยสอน โดยแสดงเฉพาะอาจารยทสอนมากที่สุด 3 คน

 
select top 3 lecid,
		count(*) as amount
from section
group by lecid
order by amount desc




 -- 50. แสดงรหัสวิชา ชื่อวิชา และ รหัสวิชาเงื่อนไข ถาวิชาใดไมมวิชาเงื่อนไข ใหแสดงขอความ ไมมวิชาเงื่อนไข

-- A = 1,2,3,4 B= 2,3,4,6,7
	A UNION B = 1,2,3,4,6,7
	A INTERSECT B = 2,3,4
	A EXCEPT B = 1
	B EXCEPT A = 6,7
	B EXCEPT B = {}
	



select name,
		isnull(prerequisite,'ไม่มีข้อมูล') as prerequisite
from subject


select dateadd(month,-4,GETDATE())


select DATEPART(DAY,GETDATE())


select sid
from student 
where EXISTS (
	select sid,count(*)
	from student 
	GROUP by sid
)

 --51. แสดง ชื่อmajor , gpa สูงสุดของ major นั้น ๆ และ gpa ต่ำสุดของ major นั้น ๆ
 --โดยไมแสดงขอมูลทmajor เปน nu l
 --ตัวอยางการแสดงผล
 --major
-- Art
-- CS
-- PY
-- Thai
-- Max_GPA
-- 3.98
-- 3.98
-- 2.85
-- 2.78
-- Min_GPA
-- 3.05
-- 1.55
-- 1.50
-- 2.78


select * 
from student

select major,
		max(gpa) as Max_gpa,
		min(gpa) as Min_gpa
from student
where major is not null
group by major



--  52.แสดง ชื่อmajor , gpa สูงสุดของ major นั้น ๆ และ gpa ต่ำสุดของ major นั้น ๆ
--  โดยแสดงเฉพาะ major ทมคา gpa ต่ำสุด มากกวา 2.00
--  ตัวอยางการแสดงผล
--  major
--  Art
--  Thai
--  Max_GPA
--  3.98
--  2.78
--  Min_GPA
--  3.05
--  2.78
--  Database Management and design: Exercises by Prymania.

select major,
		max(gpa) as Max_GPA,
		min(gpa) as Min_GPA
from student
where major is not null
group by major
having max(gpa) > 2.00
and min(gpa) > 2.00




--  53. แสดง ชื่อmajor , จำนวนนิสิตใน major นั้น, gpa สูงสุดของ major นั้น และ gpa ต่ำสุดของ major นั้น
--  โดยแสดงเฉพาะ major ทมจำนวนนิสิตมากกวา 1 คน และ gpa ต่ำสุดของ major นั้นมากกวา 1.5
--  และ major ไมเปน nu l
--  เรียงลำดับตาม จำนวนนิสิตจากมากไปนอย


select *
from student

select major,
		count(*) as amount,
		max(gpa) as Max,
		min(gpa) as min
from student
where major is not null
group by major
having count(*) >1 and min(gpa) >1.5
order by amount desc



-- 54. แสดงปเกิด และจำนวนนิสิตทเกิดปนั้น โดยแสดงเฉพาะทปไมเปน nu l
select *
from student

select year(birthday),
		count(*)
from student
where birthday is not null
group by year(birthday)

--  55.แสดง รหัสนิสิต, และจำนวนครั้งทลงเรียน
select stdid,
		count(*) as amount
from enroll
group by stdid

--  56.แสดง รหัสวิชา, และจำนวนครั้งทเคยเปดสอน
select lecid,
		count(*) as amount
from section
group by lecid

--  57.แสดง เกรด, จำนวนครั้งทไดเกรดนั้น ๆ ของนิสิตรหัส 60001
select grade,
		count(*) as amount
from enroll
where stdid = '60001'
group by grade
--  58.แสดง รหัสนิสิต และ จำนวนครั้งทไดเกรด F ของนิสิตรหัสนั้น ๆ
select stdid,
		count(*) as amount
from enroll
where grade = 'F'
group by stdid
--  59.แสดง รหัสนิสิต และ จำนวนครั้งทไดเกรด F โดยแสดงเฉพาะนิสิตทไดเกรด F มากกวา 1 ครั้ง
select stdid,
		count(*) as amount
from enroll
where grade = 'F'
group by stdid
having count(*) > 1
--  60.แสดงรหัสอาจารยทเคยสอนมากกวา 3 ครั้ง
select lecid
from section
group by lecid
having count(*) >1
--  61. แสดงรหัสอาจารยทเคยสอนวิชา CS001 มากกวา 1 ครั้ง
select lecid,
		count(*) as amount
from section
where subid = 'cs001'
group by lecid
having count(*) > 1
--  62.แสดงรหัสอาจารยรหัสวิชา และจำนวนครั้งทอาจารยเคยสอนวิชานั้น
--  โดยแสดงเฉพาะทมสอนมากกวา 1 ครั้ง เรียงลำดับตามรหัสอาจารย 
select lecid,
		subid,
		count(*) as amount
from section
group by lecid,subid
having count(*) > 1
order by substring(lecid,2,3) asc

select * 
from section
--  63.
--  แสดง ขอมูลของนิสิต โดยสนใจนิสิตทตรงตามเงื่อนไขน
--  ถาอยสาขา cs ไดgpa > 3.00
--  ถาอยสาขา py ไดgpa > 3.20
--  ถาอยสาขา art ไดgpa > 3.50
+
--  64.
--  แสดงรหัสนิสิต ชื่อ และอายของนิสิต โดยสนใจนิสิตทตรงตามเงื่อนไขน
--  ถาอยสาขา cs
--  อาย> 18 ป
--  ถาอยสาขา Art
--  ถาอยสาขา English
--  ถาอยสาขาอื่น ๆ
--  อาย> 19 ป
--  อาย> 17 ป
--  อาย> 20 ป

delete student 
where name = 'Kai'


select *
from student
where datediff(year,birthday,getdate())> case
											when major = 'cs' then 18
											when major = 'art' then 19
											when major = 'English' then 10
											else					 20
										end


-- 65.
--  เพิ่มเงินเดือนใหอาจารยโดยเพิ่มตามเงื่อนไขคือ
--  45.
--  ถาอาจารยไดเงินเดือน <= 30000 บาท เพิ่มเงินเดือนให 20 %
--  ถาอาจารยไดเงินเดือน 30001- 40000 บาท
--  เพิ่มเงินเดือนให 10 %
--  ถาอาจารยไดเงินเดือน 40001- 50000 บาท
--  ถาอาจารยไดเงินเดือนสูงกวา 50000 บาท
--  เพิ่มเงินเดือนให 5 %
--  ไมตองเพิ่มเงินเดือน


select cast(
			case
				when salary<=30000 then salary * 0.2
				when salary<=40000 then salary * 0.1
				when salary<=50000 then salary * 0.05
				else					0
			end as int) as add_salary
from lecturer

select cast(
		case 
			when salary <=30000 then salary * 0.2
			when salary<=40000 then salary * 0.1
			when salary<=50000 then salary * 0.05
			else					0
		end as int) as add_salary
from lecturer

select *
from lecture




update lecturer
set salary = salary + case
						when salary <=30000 then salary * 0.2
						when salary<=40000 then salary * 0.1
						when salary<=50000 then salary * 0.05
						else					0
					end



--  67 แสดงรหัสนิสิต และชื่อนิสิตทเคยเรียนวิชา Programming
select student.sid,
		student.name,
		subject.name,
		section.subid
from  student,section,enroll,subject
where student.sid = enroll.stdid
and   enroll.secid = section.secid
and   section.subid = subject.sid
and		subject.name = 'programming'

-- 68 แสดงรหัสนิสิต และชื่อนิสิตทเคยเรียนกับอาจารยชื่อ Peter Parker
	select *
	from lecturer

	select student.sid,
			student.name
	from student,enroll,section,lecturer
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.lecid = lecturer.lid
	and lecturer.name = 'Peter Parker'
-- 69 แสดง รหัสนิสิต ทไดเกรด A วิชา Programming
	select enroll.stdid
	from	enroll,section,subject
	where enroll.secid = section.secid
	and section.subid = subject.sid
	and enroll.grade = 'A'
	and subject.name = 'Programming'
-- 70 แสดง รหัสนิสิต ชื่อ ทไดเกรด A วิชา Programming
	select student.sid,
			student.name,
			enroll.grade,
			subject.name
	from student,enroll,section,subject
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = subject.sid
	and enroll.grade = 'A'
	and subject.name = 'Programming'
-- 71 แสดงรหัสนิสิต ชื่อนิสิต และเกรดทไดของนิสิตทเรียน section id 6
	select student.sid,
			student.name,
			enroll.grade,
			enroll.secid
	from student,enroll
	where student.sid = enroll.stdid
	and enroll.secid = 6

-- 72 แสดงรหัสนิสิต ชื่อนิสิต และเกรดทไดของนิสิตทเรียนวิชา Database ในเทอม 1-2020
	select *
	from section
	select student.sid,
			student.name,
			enroll.grade,
			subject.name
	from student,enroll,section,subject
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = subject.sid
	and section.term = '1-2020'
	and subject.name = 'Database'
-- 73 แสดงรหัสนิสิต และชื่อนิสิตของนิสิตทเคยเรียนวิชา cs001 หรือ cs002
	select sid,
		name,
		section.subid

	from section, enroll, student
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid in ('cs001','cs002')
-- 74 แสดงชื่อวิชาและเทอมทเปดสอน เรียงลำดับตามเทอม
	select *
	from section
	select *
	from enroll

	select subject.name,
			section.term
	from subject,section
	where SUBJECT.sid = section.subid
	order by substring(term,3,4),substring(term,1,1)
-- 75 แสดงวิชา , เทอมทเรียน , อาจารยผสอน และเกรดทไดของนิสิตชื่อ Rukawa
	-- !subject -- section -- eroll -- student
	select subject.name,
			section.term,
			section.lecid,
			enroll.grade
	from subject,section,enroll,student
	where student.sid =	enroll.stdid
	and enroll.secid = section.secid
	and section.subid = subject.sid
	and student.name = 'Rukawa'


	
-- 76 แสดงชื่อวิชา, เทอมทสอน, ชื่อผสอน ของทุกวิชาทสอนโดยอาจารยใน major CS
	-- !subject -- section -- lecturer
	select subject.name,
			section.term,
			lecturer.name
	from subject,section,lecturer
	where subject.sid = section.subid
	and section.lecid = lecturer.lid
	and substring(subject.sid,1,2) = 'cs'

	select *
	from subject
--  77 แสดง รหัสนิสิต, ชื่อนิสิต, ชื่อวิชา, ชื่อผสอน, เทอมทเรียน ของการเรียนทไดเกรด F
	-- !studen -- subject -- lecturer --section --enroll
	select student.sid,
			student.name,
			subject.name,
			lecturer.name,
			section.term
	from student,subject,lecturer,section,enroll
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = subject.sid
	and section.lecid = lecturer.lid
	and enroll.grade = 'F'

--  78.แสดงรหัสวิชา และชื่อวิชาทเปน pre-requisite ของวิชารหัส cs002
	-- !subject -subject
	select subject_2.sid,
			subject_2.name
	from subject subject_1,subject subject_2
	where subject_1.prerequisite = subject_2.sid
	and subject_1.sid = 'cs002'
	
--  79.แสดงรหัสวิชา และชื่อวิชาทเปน pre-requisite ของวิชา AI
	-- !subject -- subject
	select subject_2.sid,
			subject_2.name
	from subject subject_1,subject subject_2
	where subject_1.prerequisite = subject_2.sid
	and subject_1.name = 'AI'

--  80.แสดงรหัสวิชา และชื่อวิชาของทุกวิชาทมวิชา programming เปน pre-requisite
	-- !subject -- subject

	select subject_1.sid,
			subject_1.name
	from subject subject_1,subject subject_2
	where subject_1.prerequisite = subject_2.sid
	and subject_2.name = 'Programming'


-- 81. แสดงชื่ออาจารยชื่อวิชาทสอน และเทอมทสอน ของอาจารยทุกคน รวมทั้งอาจารยทไมเคยสอนเลย

	--  Lecturer -> section -> subject

	select lecturer.name as Name_lecturer,
			subject.name as Name_Subject,
			section.term as Term
	from lecturer left outer join section 
	on lecturer.lid = section.lecid
		left outer join subject 
	on section.subid = subject.sid

--  82. แสดงชื่ออาจารยชื่อวิชาทสอน และเทอมทสอน ของอาจารยทุกคน รวมทั้งอาจารยทไมเคยสอนเลย
--  โดยถาอาจารยคนใดไมเคยสอนเลย ใหแสดงขอความ ไมเคยสอน ในคอลัมนวิชา และเทอมทสอน
	select lecturer.name as Name_lecturer,
			isnull(subject.name,'ไม่เคยสอน') as Name_Subject,
			isnull(section.term,'ไม่เคยสอน') as Term
	from lecturer left outer join section 
	on lecturer.lid = section.lecid
		left outer join subject 
	on section.subid = subject.sid


--  83. แสดงรหัสนิสิต และรหัสวิชาทลงทะเบียนเรียน ของนิสิตทุกคน รวมทั้งคนทไมเคยลงทะเบียนเรียนเลย

	-- student ->enroll -> section
	select student.sid,
			section.subid
	from student left outer join enroll
	on student.sid = enroll.stdid
		left outer join section
	on enroll.secid = section.secid
	

--  84. แสดงรหัสนิสิต ชื่อวิชาเทอมทเรียน เกรดทไดของนิสิตทุกคน รวมทั้งคนทไมเคยลงทะเบียนเรียนเลย

	select student.sid as name,
			subject.name as name_subject,
			section.term as Term,
			enroll.grade as Grade
	from student left outer join enroll
	on student.sid = enroll.stdid
		left outer join section
	on enroll.secid = section.secid
		left outer join subject
	on section.subid = subject.sid

--  85. แสดงรหัสนิสิต และชื่อนิสิตของนิสิตทเคยเรียนทั้งวิชา cs001 และ cs002
	
	select student.sid,
			student.name
	from student,enroll,section
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = 'cs001'
		INTERSECT
	select student.sid,
			student.name
	from student,enroll,section
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = 'cs002'

--  86. แสดงรหัสนิสิต และชื่อนิสิตของนิสิตทเคยเรียนวิชา cs001 แตไมเคยเรียน cs002
	select student.sid,
			student.name
	from student,enroll,section
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = 'cs001'
		EXCEPT
	select student.sid,
			student.name
	from student,enroll,section
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = 'cs002'
--  87. แสดง ชื่อ, สาขา ของอาจารยทสอนในเทอม 1-2020 แตไมไดสอนเทอม 2-2020
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
	
--  89. แสดงรหัสและชื่ออาจารยทสอนวิชา Programming แตไมเคยสอน Database
	select lecturer.name,
			lecturer.lid
	from lecturer,section,subject
	where lecturer.lid = section.lecid
	and section.subid = subject.sid
	and subject.name ='programming'
		EXCEPT
	select lecturer.name,
			lecturer.lid
	from lecturer,section,subject
	where lecturer.lid = section.lecid
	and section.subid = subject.sid
	and subject.name ='database'

	select *
	from SECTION
	select *
	from LECTURER
		select *
	from subject
--  90. แสดงรหัสและชื่อนิสิตทเคยเรียน Programming แตไมเคยเรียน Graphics
	select student.sid,
			student.name
	from student,enroll,section,subject
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = subject.sid
	and subject.name = 'programming'
		EXCEPT
	select student.sid,
			student.name
	from student,enroll,section,subject
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = subject.sid
	and subject.name = 'Graphics'

--  91. แสดง ชื่อ, ปเกิด, อายของนิสิตทอายนอยที่สุด และอายมากที่สุด

	select  top 1 student.name,
			year(student.birthday) as year,
			datediff(year,birthday,getdate()) as age
	from student
	where STUDENT.birthday is not null
	and datediff(year,birthday,getdate())  = (
			select min(datediff(year,birthday,getdate()) )
			from student
	)
		UNION
	select  top 1 student.name,
			year(student.birthday) as year,
			datediff(year,birthday,getdate()) as age
	from student
	where STUDENT.birthday is not null
	and datediff(year,birthday,getdate())  = (
			select max(datediff(year,birthday,getdate()) )
			from student
	)
	order by age asc
	
--  92. แสดง ชื่อ, ปเกิด, อายของนิสิตทอายนอยที่สุด และอายมากที่สุดใน major CS

	select  top 1 student.name,
			year(student.birthday) as year,
			datediff(year,birthday,getdate()) as age
	from student
	where STUDENT.birthday is not null
	and datediff(year,birthday,getdate())  = (
			select min(datediff(year,birthday,getdate()) )
			from student
			where major = 'cs'
	)


	and major = 'CS'
		UNION
	select  top 1 student.name,
			year(student.birthday) as year,
			datediff(year,birthday,getdate()) as age
	from student
	where STUDENT.birthday is not null
	and datediff(year,birthday,getdate())  = (
			select max(datediff(year,birthday,getdate()) )
			from student
			where major = 'cs'
	)
	and major = 'CS'
	order by age asc

--  93. แสดงขอมูลของนิสิตสาขา CS ทไมเคยเรียนวิชา Programming เลย
	select student.sid,
			student.name
	from student,enroll,section,subject
	where 
student.major = 'cs'
		EXCEPT
	select student.sid,
			student.name
	from student,enroll,section,subject
	where student.sid = enroll.stdid
	and enroll.secid = section.secid
	and section.subid = subject.sid
	and student.major = 'cs'
	and subject.name = 'programming'

--  94. แสดงชื่อของอาจารยภาควิชา CS ทไมเคยสอนวิชา Programming
	update lecturer
	set salary = salary*1.2
	where EXISTS (
		select lecid,COUNT(subid)
		from section
		GROUP by lecid
		HAVING COUNT(subid)>1
	)


	select lid,name 
	from lecturer 
	where lid in (
		select 	lecid
		from LECTURER,SECTION
		WHERE lecturer.lid = section.lecid
		and salary >20000
		GROUP by lecid
		having COUNT(subid)>3
	)

-- 42แสดงรหัสอาจารย์ เทอมที่สอน และจำนวนวิชาที่สอนในเทอมนั้น
-- เฉพาะอาจารย์ที่สอนมากกว่า 1 วิชาในเทอมนั้น โดยเรียงลำดับตามรหัสอาจารย์
	

	select lecid,
			term 
	from SECTION
	GROUP by lecid,term
	HAVING count(subid)>1
	order by lecid asc


	select top 1 salary
	from lecturer 
	where salary is NOT null
	ORDER by salary asc


	select salary
	from lecturer
	where salary = (
		select max(salary)
		from LECTURER
	)

	-- 1,2,3,4 A
	EXCEPT
	-- 3,4,5 B



	select sid   
	from student
	EXCEPT
	select lid 
	from LECTURER




--  95. แสดงจำนวนนิสิตทลงทะเบียนเรียนในเทอม 2-2020 (จากขอ 2. ใหนับเฉพาะจำนวนนิสิต )
	
	select count(*)
	from student
	where sid in(
			select stdid
			from enroll,section
			where enroll.secid = SECTION.secid
			and term = '2-2020'
	)
	

	

--  96. แสดง รหัสอาจารยและชื่อ ของอาจารยทไมไดสอนในภาคเรียน 1-2020
	select lid,
			name 
	from lecturer 
	where lid in (
		select lecid
		from section
		where term not in ('1-2020')
	)
--  97. แสดง name, ปเกิด, อายของนิสิตทอายนอยที่สุด


--  98. แสดง name, ปเกิด, อายของนิสิตทอายมากที่สุด ใน major CS
--  99. แสดง ขอมูล ของนิสิตทไดGPA สูงที่สุดในมหาวิทยาลัย
--  100. แสดง ขอมูล ของนิสิตทไดGPA สูงที่สุดใน major CS
--  101. แสดง ขอมูล ของนิสิตทไดGPA สูงที่สุดใน major Thai
--  102. แสดง ขอมูล ของ นิสิตทเคยลงทะเบียนเรียน และไมเคยติด F เลย
--  103. แสดงรหัสวิชาและ ชื่อวิชา ทไมเคยเปดสอนเลย
--  104. แสดง รหัสนิสิต, และจำนวนครั้งทลงเรียน เฉพาะนิสิตทอยmajor CS
--  ตัวอยางการแสดงผล
--  stdid
--  50001
--  50002
--  50003
--  50004
--  Amount
--  5
--  4
--  4
--  2
--  Database Management and design: Exercises by Prymania.
-- 48.


--  105. แสดง เกรด, จำนวนครั้งทไดเกรดนั้น ๆ ของนิสิตชื่อ Sakuragi
--  ตัวอยางการแสดงผล
--  grade
--  A
--  B
--  F
--  1
--  2
--  Amount
--  1


--  106. แสดงขอมูลทุกอยางของอาจารยทเคยสอนมากกวา 3 ครั้ง
--  ตัวอยางการแสดงผล
--  lid
--  t01
--  t02
--  t03
--  t05
--  name
--  Peter Parker
--  Steve Roger
--  Edward Norton
--  Iron Man
--  salary
--  40000
--  50000
--  55000
--  65000
--  major
--  CS
--  CS
--  MIS
--  MIS

--  107. แสดงขอมูลของอาจารยCS ทเคยสอนวิชา Programming มากกวา 2 ครั้ง
--  108. แสดงรหัสอาจารยเทอมทสอน และจำนวนวิชาทสอนในเทอมนั้น
--  เฉพาะอาจารยทสอนมากกวา 1 วิชาในเทอมนั้น โดยเรียงลำดับตามรหัสอาจารย





--  เพิ่ม 10 % ให้กับอาจาร cs004 ในปี 2020
update lecturer
set salary = salary*1.1
where lid in (
	select distinct lecid
	from section
	where  subid = 'cs004'
	and  SUBSTRING(term,3,4) = '2020'
)

-- ให้นิสิตทุกคนที่เรียนวิชา cs004 ในเทอม 1-2019 grade A



SELECT *
from enroll


select secid 
from section
where subid = 'cs004'
and term = '1-2019'

update ENROLL
set grade = 'A'
where secid in ( 
	-- 1 2 3
	select secid 
	from SECTION
	where subid = 'cs004'
	and term = '1-2019' 
)

-- 2. เพิ่มเงินเดือน 10 % ให้อาจารย์ทุกคนที่สอนในปี 2020

update lecturer
set salary = salary*1.1
where lid in (
	select distinct lecid
	from section
	where SUBSTRING(term,3,4) ='2020'
	-- '1-2020'  3 เริ่ม,4 เอาเท่าไหร่
)

-- 3. เพิ่มเงินเดือน 20% ให้อาจารย์ทุกคนที่มีเงินเดือนต่ำกว่าค่าเฉลี่ยเงินเดือนของอาจารย์ทั้งหมด

update lecturer 
set salary = salary*1.2
where salary < (
	select avg(salary)
	from LECTURER
)

select *
from LECTURER

-- 4. เพิ่มเงินเดือน 10% ให้อาจารย์ที่สอนมากกว่า 1วิชาในเทอม 1-2020 

update LECTURER 
set salary = salary*1.1
where lid in(
	select lecid
	from SECTION
	where term = '1-2020'
	GROUP by lecid
	HAVING  COUNT(subid) > 1
)



DELETE lecturer 
where lid not in(
	select lecid
	from section
	where SUBSTRING(term,3,4) ='2020'
	GROUP by lecid
)


DELETE subject 
where sid not in (
	select subid 
	from SECTION
	GROUP by subid
)

-- Alter Table
-- 1. แก้ไข table STUDENT ให้สามารถเก็บข้อมูล ที่อยู่ และ เบอร์โทรศัพท์ได้
	alter table student
	add address VARCHAR(100),
		number VARCHAR(50)

	alter table *name_table*
	add *create_namecolumn* *datatype*,
		*create_namecolumn* *datatype*

	SELECT *
	FROM STUDENT


-- 2. แก้ไข table STUDENT ให้มีข้อมูล รหัสอาจารย์ที่ปรึกษา โดย reference จาก  table LECTURER 

	alter table student 
	add name_advisor varchar(10)

	alter TABLE student
	add CONSTRAINT  std_advisor FOREIGN KEY (name_advisor) REFERENCES lecturer(lid)


	alter table *name_tabel*
	add constraint *frees* FOREIGN key (ที่จะเก็บไว้) REFERENCES taget_table(taget_col)

	sp_help lecturer
-- 3. แก้ไข table ENROLL โดยเพิ่มคอลัมน์เพื่อเก็บข้อมูลวันที่บันทึกเกรดด้วย
	
	alter table enroll
	add time date

select *
from enroll

-- 4. เปลี่ยนชื่อ column major ของ table LECTURER เป็น department
	sp_rename 'lecturer.major' , 'department','column' 

	select *
	from LECTURER

	sp_rename 'taget_table.taget_col','new_namecol','column' <-- lock

-- 5. ลบ column birthday ของ table STUDENT
	alter Table student
	drop COLUMN birthday

	alter table *name_table*
	drop column *namecol_taget*

-- 6. กำหนดให้ salary ของ table LECTURER มีค่าอยู่ระหว่าง 10000 – 500000
	alter TABLE lecturer
	add CONSTRAINT salary_check check (salary BETWEEN 10000 and 500000)

	sp_help lecturer
-- 7. ลบ column อาจารย์ที่ปรึกษาออกจาก table STUDENT ( ถ้าลบไม่ได้ให้อ่าน error message แล้วทำตามขั้นตอนที่คิดว่าน่าจะเป็นไปได้ )
	alter TABLE student
	DROP COLUMN name_advisor

	sp_help 
	alter TABLE student
	DROP CONSTRAINT std_advisor 

-- ====================== View =========================

-- 1. GOOD_STD(sid, gpa) โดยมีเฉพาะข้อมูลของนิสิตที่ gpa 3.00 ขึ้นไป

create view GOOD_STD(sid, gpa) AS 
(	
	select sid,gpa
	from student 
	where gpa >= 3
)

-- 2. LEC_TCH(lid, amount) โดยมีข้อมูลรหัสอาจารย์ และจำนวนวิชาที่เคยสอนทั้งหมด

create view LEC_TCH(lid,amount) as 
(
	select lecid,count(*)
	from section
	group by lecid 

)


CREATE view *name_View* (col_view,...) as (
	selec col_taget...

)

-- 3. Lecturer_Load (lecid, term, amount) โดยเป็นข้อมูลรหัสอาจารย์ ภาคเรียน และจำนวนวิชาที่สอนในภาคเรียนนั้น ๆ ของอาจารย์ 

create view Lecturer_Load (lecid, term, amount) as 
(
	select lecid,term,count(*)
	from section 
	group by term,lecid

)

-- 4. Student_Credit (stdid, sum_credit) เป็นข้อมูลรหัสนิสิต และจำนวนหน่วยกิตที่เรียนทั้งหมด เฉพาะที่เกรดไม่เป็น F


create view Student_Credit (stdid, sum_credit) as 
(
	select enroll.stdid,sum(subject.credit)
	from section,subject,enroll
	where enroll.secid = section.secid
	and section.subid = subject.sid
	and enroll.grade != 'F'
	group by enroll.stdid
)

-- 5. Major_Detail(major, amount, max_gpa, min_gpa, avg_gpa ) โดยเป็นข้อมูล ชื่อภาควิชา, จำนวนนิสิต, gpa สูงสุด, gpa ต่ำสุด และ gpa เฉลี่ย ในภาควิชานั้น



	create view Major_Detail(major, amount, max_gpa, min_gpa, avg_gpa ) as 
	(
		select major,count(*),max(gpa),min(gpa),avg(gpa)
		from student
		where major is not null
		and name is not null
		group by major
	)

	SELECT *
	from Major_Detail

--1 แสดงรายชื่อของนิสิตทั้งหมดที่อยู่ใน major ที่มี gpa เฉลี่ยสูงที่สุด

	select	name
	from 	student,Major_Detail
	where 	student.major = Major_Detail.major
	and 	Major_Detail.avg_gpa = (
					select max(avg_gpa)
					from Major_Detail
	)
	
-- 2 แสดง ชื่อนิสิต , ภาควิชา และ gpa ของนิสิต ที่ได้ gpa ต่ำสุดในแต่ละภาควิชา
	
	select *
	from 	student,Major_Detail
	where 	student.major = Major_Detail.major
	and 	gpa 		  = min_gpa

-- 3 แสดง รหัสนิสิต , ชื่อนิสิต และจำนวนหน่วยกิตที่เรียนทั้งหมด ของนิสิตภาควิชา CS เท่านั้น

	select *
	from 	student,Student_Credit
	where 	STUDENT.sid = Student_Credit.stdid
	and 	major = 'cs'

-- 4 แสดงรหัส ชื่ออาจารย์และภาควิชา ของอาจารย์ที่สอนหลายวิชาที่สุด

	select *
	from 	LECTURER,LEC_TCH
	where LECTURER.lid = LEC_TCH.lid
	and LEC_TCH.amount = (
		select max(amount)
		from LEC_TCH
	)

-- 5 ใช้ข้อมูลการสอนของอาจารย์ในเทอม 2-2020 เพื่อเพิ่มเงินเดือนให้อาจารย์ 
-- โดยให้เพิ่มวิชาละ 1,000 บาท (เช่นถ้าสอน 2 วิชา เพิ่มเงินเดือน 2,000 บาท)

	update 	LECTURER
	set 	salary = salary + (amount * 1000)
	from 	LECTURER,Lecturer_Load
	where 	LECTURER.lid = Lecturer_Load.lecid
	and 	term = '2-2020'

-- 6 เพิ่มเงินเดือนให้อาจารทย์ ตามจำนวณครั้งที่สอน 

update 	LECTURER
set 	salary = salary + (case 
							when amount > 5 then 2000
							when amount > 3 then 1000
							when amount > 1 then 500
							else            0
						end * amount)
from 	LECTURER, LEC_TCH
where 	LECTURER.lid = LEC_TCH.lid


-- 7 
		select sum(case 
						when grade = 'A' then 4
						when grade = 'B' then 3
						when grade = 'C' then 2
						when grade = 'D' then 1
						when grade = 'F' then 0
					end *credit
					)/ SUM(credit)
		from enroll,SUBJECT,SECTION
		where ENROLL.secid = SECTION.secid
		and SECTION.subid = SUBJECT.sid
	




select datediff(year,GETDATE(),birthday)
from student







select *
from LEC_TCH

select *
from Major_Detail

select *
from ENROLL

select *
from STUDENT




-- =================== alter Table ========

sp_rename 'name_table' , 'change_name'
sp_rename 'name_table.col' , 'name_col' , 'column'

sp_help name_table

alter table name_table
add name_column dataType,
	name_column dataType


alter table name_table
drop column name_column


alter table name_table
alter column name_col dataType_addSite


alter table name_table
add constraint name_constraint 

-- =======================================

update lecturer
set salary = salary*1.1
where 'database' = (
	select name
	from  section,subject 
	where section.lecid = subject.sid
	and name = 'database'
)


select *
from subject

select major,
		count(*)
from student
where major is not null
group by major


select major,
		count(*)
from student
where major is not null
group by major
having max(gpa) > 3.00



select major,
		count(*) as amount
from student
where major is not null
and major in ('cs')
group by major
having max(gpa) > 3.00
and count(*) >2
order by amount desc 



select major,
		count(*) as amount
from student
where major is not null
group by major
having max(gpa) > 3.00
order by amount desc 


select * 
from student
order by gpa desc



select top 3 *
from student
order by gpa desc

select * 
from student 
where gpa >
	 case
		when major = 'cs' then 3.00
		when major = 'py' then 2.85
		else					1.00
		
	 end
and major is not null


select sid,name,gpa, cast(
			case 
				when  gpa >3.5 then 'great'
				else		         'kak'
			end as varchar(20)) as comment
from student

select *
from lecturer

select  *
from lecturer
update lecturer
set salary = 
	case
		when major = 'cs' then salary * 1.1
		when major = 'mis' then salary * 1.05
		else					salary * 1.01
	end

---------------------------- join table base------------------------

select *
from student,enroll
where student.sid = enroll.stdid 
and	  name is not null

select sid,
		name,
		grade,
		secid
from enroll,student
where student.sid = enroll.stdid 
and grade = 'A'


-- !show id and name lecturer in subject cs001 term 1-2020
select *
from section

select *
from lecturer

select *
from subject

select *
from  lecturer,section
where lecturer.lid = section.lecid
and	section.subid = 'cs001'
and section.term = '1-2020'

-- select subjetc.name as subject, 


select secid,lid,lecturer.name
from lecturer,section
where lecturer.lid = section.lecid
and term in ('1-2020','2-2020')


select subject_2.sid,subject_2.name
from subject subject_1 , subject subject_2
where subject_1.prerequisite = subject_2.sid
and subject_1.name = 'oop'

select subject_1.sid,subject_2.name
from subject subject_1 , subject subject_2
where subject_1.prerequisite = subject_2.sid
and subject_1.name = 'programming'


-- select *
-- from subject


--  6.1 Join and Nested Statement

--  1.แสดงรหัสนิสิต และชื่อนิสิตทเคยเรียนวิชา CS001
select *
from section

select *
from enroll
select *
from student
select *
from subject
select *
from lecturer



select sid,
		name

from section, enroll, student
where student.sid = enroll.stdid
and enroll.secid = section.secid
and section.subid = 'cs001'

-- ============================================



-- แสดง lid name 

select lid,name 
from lecturer,section 
where lecturer.lid = section.lecid
and term = '1-2020'
	UNION
select lid,name
from lecturer,section 
where lecturer.lid = section.lecid
and term = '3-2020'


-- ========================
select lid,name,subid
from lecturer,section 
where lecturer.lid = section.lecid
and term = '1-2020'
	UNION
select lid,name,subid
from lecturer,section 
where lecturer.lid = section.lecid
and term = '3-2020'
-- ========================

select lid,name 
from lecturer,section 
where lecturer.lid = section.lecid
and term in ('3-2020','1-2020')



select lid,name
from lecturer,section 
where lecturer.lid = section.lecid
and term = '1-2020'
	UNION
select lid,name --- column ต้องเท่ากัน
from lecturer 
where salary > 20000

---=============== Outer Join Query =====================
-- left right Full Outerjoin

-- Left Outer Join

--  inner join
select lid,name,term 
from lecturer,section 
where lecturer.lid = section.lecid
order by name


-- Outerjoin
select lid,name,term 
from lecturer left outer join section
on lecturer.lid = section.lecid
order by 

select lecturer.lid,lecturer.name,section.term 
from lecturer full outer join section
on lecturer.lid = section.lecid
	full outer join subject
on subject.sid = section.subid
order by lecturer.name



-- Nested query

-- แสดงชื่ออาจารที่สอน 1-2020
select name 
from lecturer
where lid in (
	select lid 
	from SECTION
	where term = '1-2020'
)

-- แสดงชื่ออาจารที่ไม่ได้สอน 1-2020

select name 
from lecturer
where lid not in (
	select lecid
	from SECTION
	where term = '1-2020'
)


select *
from student
where sid not in (
	select stdid
	from enroll 
	where grade ='F'
)


select *
from student 
where gpa = (
	select max(gpa)
	from student
)


select *
from student 
where gpa > (
	select avg(gpa)
	from student
)




select *
from student 
where gpa = (
	select max(gpa)
	from student
	where major = 'py'
	
) and major = 'py'


-- Nested query with EXISTS




-- create procedure

create procedure 
	@parameter dataType
as 
	select *
	from @parameter 


-- show 
	exec name_procedure parameter


-- local variable

declare 
	@name_variable datatype 

select @name_variable = 'kai'

select @name_variable = max(gpa) 
					from student

drop procedure name_procedure


update 
from student


if()
	BEGIN

	end




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



