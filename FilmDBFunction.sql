--1
create function Total_Income (@Comp_Name varchar(30))
returns int
as begin
declare @ret int
select @ret = SUM(fadb.Film.F_Revenue)
from fadb.Film inner join fadb.Company on fadb.Film.Comp_ID = fadb.Company.Comp_ID where fadb.Company.Comp_Name = @Comp_Name
return @ret
end

go

select * from fadb.Film

select dbo.Total_Income('Castle Rock Entertaintment') as 'Total Income'


go
--2
create function Total_Cost (@Comp_Name varchar(30))
returns int
as begin
declare @ret int
select @ret = SUM(fadb.Film.F_Budget)
from fadb.Film inner join fadb.Company on fadb.Film.Comp_ID = fadb.Company.Comp_ID where fadb.Company.Comp_Name = @Comp_Name
return @ret
end

go

select dbo.Total_Cost('Castle Rock Entertaintment') as 'Total Cost'

go

--3
create function Net_Income (@Comp_Name varchar(30))
returns int
as begin
declare @ret int
select @ret = SUM(fadb.Film.F_Revenue)-SUM(fadb.Film.F_Budget)
from fadb.Film inner join fadb.Company on fadb.Film.Comp_ID = fadb.Company.Comp_ID where fadb.Company.Comp_Name = @Comp_Name
return @ret
end

select dbo.Net_Income('Castle Rock Entertaintment') as 'Net Income'

go
--4
create function Display_by_FilmPoint (@Point as int)
returns table
as
return (select * from fadb.Film where F_CAvg >= @Point)

select * from dbo.Display_by_FilmPoint (87) order by F_CAvg desc

go

--5
create function Display_Directors_FilmCount (@D_FName varchar(30), @D_LName varchar(30))
returns int
as begin 
declare @ret int
select @ret = COUNT(FID) from fadb.Director inner join fadb.Film on Film.DID = Director.DID where D_Fname = @D_FName and D_Lname = @D_LName
return @ret
end


select dbo.Display_Directors_FilmCount ('Quentin','Tarantino') as filmcount
