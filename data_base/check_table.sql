
	select * 
	from INFORMATION_SCHEMA.TABLES
	where TABLE_SCHEMA LIKE 'DB_66011212072%'

select suggestedid,
		count(*)
from customer
GROUP by suggestedid



