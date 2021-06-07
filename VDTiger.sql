select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME like '%field%';  
select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME like 'vtiger_field'
select * from vtiger_field where fieldlabel like '%Corporate%'; 

-- 8 records
select 
  f.columnname, f.fieldlabel, f.tablename, 
  c.COLUMN_TYPE, case when c.IS_NULLABLE = 'YES' then 'NULL' else 'NOT NULL' end as NULLABLE
from 
  vtiger_field f
  inner join INFORMATION_SCHEMA.COLUMNS c 
    on f.tablename = c.TABLE_NAME 
    and f.columnname = c.COLUMN_NAME    
where f.fieldlabel regexp 'Subject'

select left(b.cf_812, 10), b.cf_830, b.cf_832, a.*
from vtiger_account a
	left outer join vtiger_accountscf b
		on b.accountid = a.accountid
where b.cf_832 like '%Howard%' and b.cf_830 like 'Craig%'


select distinct 
  cf_1143   
from vtiger_accountscf
;

select regexp '^[TY1]' as ProfCustVisit;  