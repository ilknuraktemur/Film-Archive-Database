--1
create trigger trg_Update on fadb.Category
after update, delete 
as begin
if(exists(select * from fadb.Category))
begin 
raiserror('Category can not update or delete.',1,1) 
rollback transaction
end
end

select * from fadb.Category

delete from fadb.Category where CID = 7

go
--2
create trigger trg_GetAvg on fadb.Film_Critic
after insert
as begin
update fadb.Film
set F_CAvg = (select AVG(C_Point) from fadb.Film_Critic where fadb.Film.FID = fadb.Film_Critic.FID)
end

go
--3
create trigger trg_GetRev on fadb.Film
after insert 
as begin
update fadb.Company
set C_Revenue = (select SUM(fadb.Film.F_Revenue) 
from fadb.Film inner join fadb.Company on fadb.Film.Comp_ID = fadb.Company.Comp_ID)
end


go
--4
create trigger trg_GetBud on fadb.Film
after insert 
as begin
update fadb.Company
set C_Budget = (select SUM(fadb.Film.F_Budget) 
from fadb.Film inner join fadb.Company on fadb.Film.Comp_ID = fadb.Company.Comp_ID)
end

go


