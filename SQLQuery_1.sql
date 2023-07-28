-- https://learn.microsoft.com/en-us/sql/relational-databases/track-changes/enable-and-disable-change-data-capture-sql-server?view=sql-server-ver16

use mydb

create table emp1(name varchar(20), id int PRIMARY KEY)

EXEC sys.sp_cdc_enable_db;

EXEC sys.sp_cdc_enable_table  
@source_schema = N'dbo',  
@source_name   = N'emp1',  
@role_name     = NULL,  
@supports_net_changes = 1 

insert into emp1 values('ammu', 1)

SELECT * FROM cdc.change_tables

SELECT * FROM cdc.dbo_emp1_ct

insert into emp1 values('pragathi', 2)

select * from emp1