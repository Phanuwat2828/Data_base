--1. áÊ´§ ÃËÑÊ ª×èÍ áÅÐÊÒ¢Ò ¢Í§¹ÔÊÔµ·Ø¡¤¹·ÕèäÁèÁÕª×èÍ
select name,
		sid,
		major
from  student
where name is not null

-- 2. áÊ´§ ÃËÑÊ ª×èÍ áÅÐÊÒ¢Ò ¢Í§¹ÔÊÔµ·Ø¡¤¹·Õè·Ñé§ª×èÍ áÅÐÊÒ¢Ò äÁèà»ç¹¤èÒÇèÒ§
select name,
		sid,
		major
from  student
where name is not null and major is not null


--3.áÊ´§ ÃËÑÊ ª×èÍ áÅÐÊÒ¢Ò ¢Í§¹ÔÊÔµ·Ø¡¤¹·ÕèÍÂÙè ÊÒ¢Ò CS

select *
from student

select name,
		sid,
		major
from  student
where major = 'CS'

select gpa
from student 

-- 4.áÊ´§ ÃËÑÊ ª×èÍ áÅÐÊÒ¢Ò ¢Í§¹ÔÊÔµ·Ø¡¤¹·ÕèÍÂÙè ÊÒ¢Ò CS ËÃ×Í PY
select name,
		sid,
		major
from  student
where major in ('CS','PY')



-- 5.áÊ´§ ÃËÑÊ ª×èÍ áÅÐÊÒ¢Ò ¢Í§¹ÔÊÔµ·Ø¡¤¹·ÕèäÁèä´éÍÂÙè ÊÒ¢Ò CS, MA, PY

select name,
		sid,
		major
from  student
where major not in ('CS', 'MA', 'PY')

-- 6.áÊ´§ ÃËÑÊ ª×èÍ áÅÐÊÒ¢Ò ¢Í§¹ÔÊÔµ·Ø¡¤¹·Õèª×èÍ¢Öé¹µé¹´éÇÂµÑÇ S
select name,
		sid,
		major
from	student
where	name like ('S%')



--7.áÊ´§ ÃËÑÊ ª×èÍ áÅÐÊÒ¢Ò ¢Í§¹ÔÊÔµ·Ø¡¤¹·Õèª×èÍ¢Öé¹µé¹´éÇÂµÑÇ K áÅÐÅ§·éÒÂ´éÇÂ A
select name,
		sid,
		major
from	student
where	name like ('K%A')

-- 8.áÊ´§ ª×èÍ¹ÔÊÔµ ÊÒ¢Ò áÅÐ gpa ¢Í§¹ÔÊÔµ·Ø¡¤¹·Õè gpa ÍÂÙèÃÐËÇèÒ§  2.00 ¶Ö§ 3.00
select name,
		major,
		gpa
from	student
where	gpa >2.0 and gpa < 3.00



-- 9.áÊ´§ ª×èÍ¹ÔÊÔµ ÊÒ¢Ò áÅÐ gpa ¢Í§¹ÔÊÔµ·Ø¡¤¹·ÕèäÁèä´éÍÂÙè CS ËÃ×Í PY àÃÕÂ§ÅÓ´ÑºµÒÁ gpa ¨Ò¡ÁÒ¡ä»¹éÍÂ
select name,
		major,
		gpa
from	student
where	major not in ('CS','PY') 
order by	gpa asc


-- 10.áÊ´§ ª×èÍ¹ÔÊÔµ ÊÒ¢Ò áÅÐ gpa ¢Í§¹ÔÊÔµ·Ø¡¤¹ àÃÕÂ§ÅÓ´ÑºµÒÁ ÊÒ¢Ò áÅÐ gpa ¨Ò¡¹éÍÂä»ÁÒ¡
select name,
		major,
		gpa
from	student 
where	major is not null
order by	gpa asc


-- 11.áÊ´§ gpa ·ÕèÊÙ§·ÕèÊØ´ áÅÐ µèÓ·ÕèÊØ´¢Í§¹ÔÊÔµ â´ÂãËéáÊ´§à»ç¹ column ª×èÍ max_gpa áÅÐ min_gpa

select max(gpa) as max_gpa,
		min(gpa) as min_gpa
from student

-- 12.áÊ´§ gpa ·ÕèÊÙ§·ÕèÊØ´ áÅÐ gpa µèÓÊØ´ ¢Í§ ÊÒ¢Ò CS â´ÂãËéáÊ´§à»ç¹ column ª×èÍ max_cs áÅÐ min_cs
select max(gpa) as max_gpa,
		min(gpa) as min_gpa
from student
where major in ('CS')


-- 13.áÊ´§ÃËÑÊÇÔªÒ·Õèà»ç¹ prerequisite ¢Í§ÇÔªÒ Graphics
select prerequisite
from subject
where name in ('Graphics')


-- 14.áÊ´§ÃËÑÊáÅÐª×èÍÇÔªÒ ¢Í§ÇÔªÒ·ÕèäÁèÁÕÇÔªÒ prerequisite
select sid,
		name
from subject
where prerequisite is not null


-- 15.ÇÔªÒã´ºéÒ§·ÕèÁÕË¹èÇÂ¡Ôµ 3 Ë¹èÇÂ¡Ôµ¢Öé¹ä»
select *
from subject
where credit >=3



-- 16ÇÔªÒã´ºéÒ§·ÕèÁÕÇÔªÒ CS001 à»ç¹ÇÔªÒ prerequisite
select *
from subject
where prerequisite = ('CS001')

-- 17.ÁÕ¡ÕèÇÔªÒ·ÕèÇÔªÒÃËÑÊ CS001 à»ç¹ÇÔªÒ prerequisite
select count(*) as amount
from subject
where prerequisite in ('CS001') 

-- 18.áÊ´§¢éÍÁÙÅÍÒ¨ÒÃÂì·Õèä´éà§Ô¹à´×Í¹ÃÐËÇèÒ§ 20000 – 40000
select *
from lecturer
where salary >=20000 and salary <=40000



-- 19.à§Ô¹à´×Í¹·ÕèÊÙ§·ÕèÊØ´¢Í§ÍÒ¨ÒÃÂìÊÒ¢Ò CS ¤×Íà·èÒäÃ
select max(salary) as Max_salary
from lecturer
where major in ('CS')

-- 20.à§Ô¹à´×Í¹à©ÅÕèÂ¢Í§ÍÒ¨ÒÃÂìã¹ÊÒ¢Ò English ¤×Íà·èÒäÃ
select avg(salary) as Max_salary
from lecturer
where major in ('English')


-- 21ÍÒ¨ÒÃÂìã¹ÊÒ¢Ò English ã¤ÃºéÒ§·Õèä´éà§Ô¹à´×Í¹µèÓ¡ÇèÒ 40000 ºÒ·
select *
from lecturer
where major in ('English') and salary <40000


-- 22.áÊ´§¢éÍÁÙÅÍÒ¨ÒÃÂì·ÕèÍÂÙèÀÒ¤ÇÔªÒÍ×è¹ æ ·ÕèäÁèãªè CS ËÃ×Í MIS
select *
from lecturer
where major not in ('CS','MIS')

-- 23.áÊ´§à§Ô¹à´×Í¹ÃÇÁ·Ñé§ËÁ´, à§Ô¹à´×Í¹ÊÙ§ÊØ´, à§Ô¹à´×Í¹µèÓÊØ´ , ¤èÒà©ÅÕèÂà§Ô¹à´×Í¹ ¢Í§ÍÒ¨ÒÃÂì
select sum(salary) as sum_salary,
		max(salary) as max_salary,
		min(salary) as min_salary,
		avg(salary) as avg_salary
from lecturer


-- 24.â´ÂãËéáÊ´§à»ç¹ column ª×èÍ total_salary, max_salary, min_salary áÅÐ average_salary
select sum(salary) as total_salary,
		max(salary) as max_salary,
		min(salary) as min_salary,
		avg(salary) as avg_salary
from lecturer
-- 25.áÊ´§à§Ô¹à´×Í¹ÃÇÁ·Ñé§ËÁ´, à§Ô¹à´×Í¹ÊÙ§ÊØ´, à§Ô¹à´×Í¹µèÓÊØ´ , ¤èÒà©ÅÕèÂà§Ô¹à´×Í¹ ¢Í§ÍÒ¨ÒÃÂìÊÒ¢Ò English
--â´ÂãËéáÊ´§à»ç¹ column ª×èÍ total_sal, max_sal, min_sal áÅÐ average_sal

select sum(salary) as total_salary,
		max(salary) as max_salary,
		min(salary) as min_salary,
		avg(salary) as avg_salary
from lecturer
where major in ('English')



-- 25.áÊ´§ÃËÑÊÍÒ¨ÒÃÂì·ÕèÊÍ¹ÇÔªÒ CS001 à·ÍÁ 1-2020 
select *
from section
where subid in ('CS001') and term = '1-2020'
-- 26.section ÃËÑÊã´ºéÒ§·Õèà»Ô´ÊÍ¹ÇÔªÒÃËÑÊ CS001
select *
from section
where subid = 'CS001'

-- 27.à·ÍÁ 1-2021 à»Ô´ÊÍ¹·Ñé§ËÁ´¡ÕèÇÔªÒ
select *
from section
where term = '1-2021'

--28.áÊ´§¨Ó¹Ç¹ÇÔªÒ·Õèà»Ô´ÊÍ¹»Õ 2020
select *
from section
where substring(term,3,4) = '2020'

-- 29.áÊ´§ section id, subject id, lecturer id áÅÐ à·ÍÁ ¢Í§¡ÒÃÊÍ¹·Õèà»Ô´ÊÍ¹·Ø¡à·ÍÁã¹»Õ 2020
select secid,
		subid,
		lecid,
		term
from section
where substring(term,3,4) = '2020'

select term
from section

-- 30.áÊ´§ ÃËÑÊÇÔªÒ ·Õèà»Ô´ÊÍ¹ã¹»Õ 2020 ( ·Ñé§  1-2020 áÅÐ 2-2020 ) â´ÂäÁèáÊ´§ÃËÑÊ«éÓ¡Ñ¹
select distinct subid
from section
where substring(term,3,4) = '2020'

--31.áÊ´§ÃËÑÊÇÔªÒ·ÕèÊÍ¹â´ÂÍÒ¨ÒÃÂìÃËÑÊ t01 â´ÂáÊ´§ÃËÑÊäÁè«éÓ¡Ñ¹
select distinct subid
from section
where substring(term,3,4) = '2020' 
and lecid = 't01'


-- 32.ÍÒ¨ÒÃÂìÃËÑÊ t02 à¤ÂÊÍ¹·Ñé§ËÁ´¡Õè¤ÃÑé§
select count(*) as amount
from section
where lecid = 't02'

-- 33.ÇÔªÒÃËÑÊ CS005 à¤Âà»Ô´ÊÍ¹·Ñé§ËÁ´¡Õè¤ÃÑé§
select count(*) as amount
from section
where subid = 'CS005'

-- 34.áÊ´§ÃËÑÊ¹ÔÊÔµ·Õèä´éà¡Ã´ A â´ÂáÊ´§ÃËÑÊäÁè«éÓ¡Ñ¹
select distinct stdid
from enroll
where grade = 'A'

-- 35.áÊ´§ÃËÑÊ¹ÔÊÔµ·ÕèÅ§·ÐàºÕÂ¹àÃÕÂ¹¤ÍÃìÊ section id 5
select stdid
from  enroll
where secid = 5



-- 36.áÊ´§ÃËÑÊ¹ÔÊÔµ·ÕèÅ§·ÐàºÕÂ¹àÃÕÂ¹¤ÍÃìÊ section id 1 áÅÐà¡Ã´äÁèà»ç¹ F

select stdid
from  enroll
where secid = 1 and grade != 'F'

-- 37.áÊ´§¨Ó¹Ç¹¹ÔÊÔµ·ÕèÅ§·ÐàºÕÂ¹àÃÕÂ¹ section 2 áÅÐ à¡Ã´äÁèà»ç¹ F
select count(*)
from  enroll
where secid = 2 and grade != 'F'

-- 38. áÊ´§¨Ó¹Ç¹¤ÃÑé§·Õè¹ÔÊÔµÃËÑÊ 60001 Å§·ÐàºÕÂ¹àÃÕÂ¹
select count(*)
from  enroll
where stdid = '60001'
-- 39.áÊ´§¨Ó¹Ç¹¤ÃÑé§·Õè¹ÔÊÔµÃËÑÊ 60006 ä´éà¡Ã´ F
select count(*)
from  enroll
where grade = 'F'

-- 40.áÊ´§ ÃËÑÊ ª×èÍ áÅÐÇÑ¹à¡Ô´ ¢Í§¹ÔÊÔµ·Ø¡¤¹·Õèà¡Ô´»Õ 2005
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

-- 41.áÊ´§ ÃËÑÊ ª×èÍ áÅÐÇÑ¹à¡Ô´ ¢Í§¹ÔÊÔµ·Ø¡¤¹·ÕèÁÕÍÒÂØ 20 »Õ¢Öé¹ä»
select sid,
		name,
		birthday
from student
where datediff(year,birthday,getdate()) = 20


-- 42.áÊ´§ ÃËÑÊ¹ÔÊÔµ áÅÐª×èÍ ¢Í§¹ÔÊÔµ·Ø¡¤¹·Õèà¡Ô´à´×Í¹ September
select sid,
		name,
		birthday
from student
where datepart(month,birthday) = 9
-- 43.áÊ´§ ÃËÑÊ¹ÔÊÔµ ª×èÍ áÅÐÍÒÂØ ¢Í§¹ÔÊÔµ·Ø¡¤¹·Õèà¡Ô´ÇÑ¹¾ÄËÑÊº´Õ
select sid,
		name,
		birthday,
		datediff(year,birthday,getdate())
from student
where datename(weekday,birthday) = 'พฤหัสบดี'



-- 44.áÊ´§ ÃËÑÊ¹ÔÊÔµ ª×èÍ »Õà¡Ô´ áÅÐ ÍÒÂØ ¢Í§¹ÔÊÔµ·Ø¡¤¹
select sid,
		name,
		birthday,
		datediff(year,birthday,getdate())
from student
-- 45.áÊ´§ ÃËÑÊ¹ÔÊÔµ ª×èÍ ÊÒ¢Ò »Õà¡Ô´, ÍÒÂØ ¢Í§¹ÔÊÔµ·ÕèÍÒÂØ¹éÍÂ¡ÇèÒ 20 »Õ áÅÐäÁèä´éÍÂÙè ÊÒ¢Ò CS
select sid,
		name,
		birthday,
		datediff(year,birthday,getdate()) as age
from student
where datediff(year,birthday,getdate()) < 20 and major not in ('CS')

--ISNULL, TOP, Group by - having
-- 46.áÊ´§¢éÍÁÙÅ¢Í§¹ÔÊÔµ ·Õèä´é GPA ÊÙ§·ÕèÊØ´ã¹ major CS
select max(gpa) as gpa,
		sid,
		name
from student
group by major
having major = 'CS'


áÊ´§¢éÍÁÙÅ¢Í§ÍÒ¨ÒÃÂì·Õèà§Ô¹à´×Í¹¹éÍÂ·ÕèÊØ´ 2 ¤¹
áÊ´§ÃËÑÊÍÒ¨ÒÃÂì áÅÐ¨Ó¹Ç¹¤ÃÑé§·Õèà¤ÂÊÍ¹ 
áÊ´§ÃËÑÊÍÒ¨ÒÃÂì áÅÐ¨Ó¹Ç¹¤ÃÑé§·Õèà¤ÂÊÍ¹ â´ÂáÊ´§à©¾ÒÐÍÒ¨ÒÃÂì·ÕèÊÍ¹ÁÒ¡·Õè 3 ¤¹
áÊ´§ÃËÑÊÇÔªÒ ª×èÍÇÔªÒ áÅÐ ÃËÑÊÇÔªÒà§×èÍ¹ä¢ ¶éÒÇÔªÒã´äÁèÁÕÇÔªÒà§×èÍ¹ä¢ ãËéáÊ´§¢éÍ¤ÇÒÁ  äÁèÁÕÇÔªÒà§×èÍ¹ä¢

áÊ´§ ª×èÍmajor , gpa ÊÙ§ÊØ´¢Í§ major ¹Ñé¹ æ áÅÐ gpa µèÓÊØ´¢Í§ major ¹Ñé¹ æ 
â´ÂäÁèáÊ´§¢éÍÁÙÅ·Õè major à»ç¹ null
µÑÇÍÂèÒ§¡ÒÃáÊ´§¼Å
major		Max_GPA	Min_GPA
Art		3.98		3.05
CS		3.98		1.55
PY		2.85		1.50
Thai		2.78		2.78

áÊ´§ ª×èÍmajor , gpa ÊÙ§ÊØ´¢Í§ major ¹Ñé¹ æ áÅÐ gpa µèÓÊØ´¢Í§ major ¹Ñé¹ æ 
â´ÂáÊ´§à©¾ÒÐ major ·ÕèÁÕ¤èÒ gpa µèÓÊØ´ ÁÒ¡¡ÇèÒ 2.00
µÑÇÍÂèÒ§¡ÒÃáÊ´§¼Å
major		Max_GPA	Min_GPA
Art		3.98		3.05
Thai		2.78		2.78

 áÊ´§ ª×èÍmajor , ¨Ó¹Ç¹¹ÔÊÔµã¹ major ¹Ñé¹, gpa ÊÙ§ÊØ´¢Í§ major ¹Ñé¹ áÅÐ gpa µèÓÊØ´¢Í§ major ¹Ñé¹ 
â´ÂáÊ´§à©¾ÒÐ major ·ÕèÁÕ¨Ó¹Ç¹¹ÔÊÔµÁÒ¡¡ÇèÒ 1 ¤¹ áÅÐ gpa µèÓÊØ´¢Í§ major ¹Ñé¹ÁÒ¡¡ÇèÒ 1.5
áÅÐ  major äÁèà»ç¹ null
àÃÕÂ§ÅÓ´ÑºµÒÁ ¨Ó¹Ç¹¹ÔÊÔµ¨Ò¡ÁÒ¡ä»¹éÍÂ



áÊ´§»Õà¡Ô´ áÅÐ¨Ó¹Ç¹¹ÔÊÔµ·Õèà¡Ô´»Õ¹Ñé¹ â´ÂáÊ´§à©¾ÒÐ·Õè»ÕäÁèà»ç¹ null

áÊ´§ ÃËÑÊ¹ÔÊÔµ, áÅÐ¨Ó¹Ç¹¤ÃÑé§·ÕèÅ§àÃÕÂ¹ 
áÊ´§ ÃËÑÊÇÔªÒ, áÅÐ¨Ó¹Ç¹¤ÃÑé§·Õèà¤Âà»Ô´ÊÍ¹
áÊ´§ à¡Ã´, ¨Ó¹Ç¹¤ÃÑé§·Õèä´éà¡Ã´¹Ñé¹ æ ¢Í§¹ÔÊÔµÃËÑÊ 60001
áÊ´§ ÃËÑÊ¹ÔÊÔµ áÅÐ ¨Ó¹Ç¹¤ÃÑé§·Õèä´éà¡Ã´ F ¢Í§¹ÔÊÔµÃËÑÊ¹Ñé¹ æ  
áÊ´§ ÃËÑÊ¹ÔÊÔµ áÅÐ ¨Ó¹Ç¹¤ÃÑé§·Õèä´éà¡Ã´ F â´ÂáÊ´§à©¾ÒÐ¹ÔÊÔµ·Õèä´éà¡Ã´ F ÁÒ¡¡ÇèÒ 1 ¤ÃÑé§
áÊ´§ÃËÑÊÍÒ¨ÒÃÂì·Õèà¤ÂÊÍ¹ÁÒ¡¡ÇèÒ 3 ¤ÃÑé§
áÊ´§ÃËÑÊÍÒ¨ÒÃÂì·Õèà¤ÂÊÍ¹ÇÔªÒ CS001 ÁÒ¡¡ÇèÒ 1 ¤ÃÑé§
áÊ´§ÃËÑÊÍÒ¨ÒÃÂì ÃËÑÊÇÔªÒ áÅÐ¨Ó¹Ç¹¤ÃÑé§·ÕèÍÒ¨ÒÃÂìà¤ÂÊÍ¹ÇÔªÒ¹Ñé¹  
â´ÂáÊ´§à©¾ÒÐ·ÕèÁÕÊÍ¹ÁÒ¡¡ÇèÒ 1 ¤ÃÑé§ àÃÕÂ§ÅÓ´ÑºµÒÁÃËÑÊÍÒ¨ÒÃÂì

Select , update statement with CASE
áÊ´§ ¢éÍÁÙÅ¢Í§¹ÔÊÔµ â´ÂÊ¹ã¨¹ÔÊÔµ·ÕèµÃ§µÒÁà§×èÍ¹ä¢¹Õé
¶éÒÍÂÙèÊÒ¢Ò cs 	ä´é gpa > 3.00
¶éÒÍÂÙèÊÒ¢Ò py 	ä´é gpa > 3.20
¶éÒÍÂÙèÊÒ¢Ò art 	ä´é gpa > 3.50

áÊ´§ÃËÑÊ¹ÔÊÔµ ª×èÍ áÅÐÍÒÂØ¢Í§¹ÔÊÔµ â´ÂÊ¹ã¨¹ÔÊÔµ·ÕèµÃ§µÒÁà§×èÍ¹ä¢¹Õé
¶éÒÍÂÙèÊÒ¢Ò cs  		ÍÒÂØ > 18 »Õ
¶éÒÍÂÙèÊÒ¢Ò Art	  	ÍÒÂØ > 19 »Õ
¶éÒÍÂÙèÊÒ¢Ò English  		ÍÒÂØ > 17 »Õ
¶éÒÍÂÙèÊÒ¢ÒÍ×è¹ æ  		ÍÒÂØ > 20 »Õ
à¾ÔèÁà§Ô¹à´×Í¹ãËéÍÒ¨ÒÃÂì â´Âà¾ÔèÁµÒÁà§×èÍ¹ä¢¤×Í
¶éÒÍÒ¨ÒÃÂìä´éà§Ô¹à´×Í¹ <= 30000 ºÒ· 	à¾ÔèÁà§Ô¹à´×Í¹ãËé 	20 %
¶éÒÍÒ¨ÒÃÂìä´éà§Ô¹à´×Í¹ 30001 - 40000 ºÒ· 	à¾ÔèÁà§Ô¹à´×Í¹ãËé  10 %
¶éÒÍÒ¨ÒÃÂìä´éà§Ô¹à´×Í¹ 40001 - 50000 ºÒ· 	à¾ÔèÁà§Ô¹à´×Í¹ãËé 	 5 %
¶éÒÍÒ¨ÒÃÂìä´éà§Ô¹à´×Í¹ÊÙ§¡ÇèÒ 50000 ºÒ· 	äÁèµéÍ§à¾ÔèÁà§Ô¹à´×Í¹




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