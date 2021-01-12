--1
create procedure match_Film_Actor
@Fname varchar(30) as
declare @FID int 
set @FID = (select FID from fadb.Film  where F_name = @FName )
UPDATE fadb.Film_Actor
SET FID = (select FID from fadb.Film where FID = @FID) where FID is null

exec match_Film_Actor 'The Shawshank Redemption' 

go
--2
create procedure display_one_Film_Actor
@F_name varchar(30) as
select fadb.Film.F_Name, fadb.Actor.A_FName, fadb.Actor.A_LName from fadb.Actor
inner join fadb.Film_Actor
on (fadb.Film_Actor.AID = Actor.AID) inner join fadb.Film on (fadb.Film_Actor.FID= fadb.Film.FID) where F_Name = @F_Name


exec display_one_Film_Actor 'Django Unchained'


go
--3
create procedure display_one_Film_Options
@Film_Name varchar(30) as
select k1.F_Name, Subtitle, Audio from Film_Audio k1
inner join Film_Subtitle k2 on (k1.F_Name= k2.F_Name) where k1.F_Name= @Film_Name

exec display_one_Film_Options 'The Shawshank Redemption'


go
--4
create procedure display_one_Film_Actor_Roles
@FilmName varchar(30) as
select F_Name, concat(R_LName, ' ',R_FNAme) as Role_Name, concat(A_fName, ' ' ,A_LName) as Actor_Name from fadb.Role
inner join fadb.Film_Actor on Film_Actor.AID =  fadb.Role.AID inner join fadb.Film 
on Film.FID = Film_Actor.FID inner join fadb.Actor on Actor.AID = Film_Actor.AID where F_Name = @FilmName


exec display_one_Film_Actor_Roles 'Django Unchained'


go
--5
create procedure display_Actor_films 
@A_FName varchar(30),
@A_LName varchar(30)  as
select F_Name, concat(A_fName, ' ' ,A_LName) as Actor_Name from fadb.Film
inner join fadb.Film_Actor ON fadb.Film.FID = fadb.Film_Actor.FID inner join
fadb.Actor ON fadb.Film_Actor.AID = fadb.Actor.AID where A_FName = @A_FName and A_LName = @A_LName


exec display_Actor_films 'Jamie' ,'Foxx'

go

--6
create procedure adding_Actor_Film
@FilmName varchar(30),
@A_FName varchar(30),
@A_LName varchar(30) as
insert into fadb.Film_Actor (FID,AID)	
select FID, AID from fadb.Film 
cross join fadb.Actor where A_FName = @A_FName and A_LName = @A_LName and F_Name= @FilmName


go

--7
create procedure adding_Category_Film
@F_Name varchar(30),
@C_Name varchar(30) as
insert into fadb.Film_Category(FID,CID)	
select FID, CID from fadb.Film 
cross join fadb.Category where F_Name = @F_Name and C_Name= @C_Name


exec adding_Category_Film 'The Shawshank Redemption','Drama'

go

--8
create procedure display_one_CategoryFilm
@C_Name varchar(30) as
select fadb.Category.C_Name, fadb.Film.F_Name from fadb.Category
inner join fadb.Film_Category
on (fadb.Film_Category.CID = Category.CID) inner join fadb.Film on (fadb.Film_Category.FID= fadb.Film.FID) where C_Name = @C_Name

exec display_one_CategoryFilm 'Drama'

go

--9
create procedure display_byDuration
@min time(0),@max time(0) as
select*from fadb.Film where F_length between @min and @max

exec display_byDuration '2:30:00', '2:50:00'

go
--10
create procedure display_byRelease_Year
@year int as
select * from fadb.Film where YEAR(F_RDate) = @year

exec display_byRelease_Year '1994'

go

--11
create procedure display_byCountry
@name varchar(30) as
select CountryName, F_Name from fadb.Film k1 inner join fadb.Country k2 on k1.Country_ID=k2.Country_ID where CountryName=@name

exec display_byCountry 'america'

go

--12
create procedure All_Atributes_of_a_Film 
@Film_Name varchar(30) as
select FA.F_Name, F_Desc, F_length, F_RDate, F_CAvg, F_Budget, F_Revenue, CONCAT(D_Fname, ' ', D_Lname) as Director_Name,
 Audio, Subtitle,CONCAT(A_FName, ' ', A_LName) as Actor_Name, CONCAT(R_LName, ' ', R_FName) as Role_Name, 
 C_Name, Comp_Name, CountryName, CONCAT(C_FName, ' ', C_LName) as Critic_Name, C_Comment, C_Point  
 from fadb.Film FA
inner join fadb.Film_Actor AAR on FA.FID = AAR.FID inner join fadb.Actor AA on AA.AID = AAR.AID
inner join dbo.Film_Audio FAO on FA.F_Name = FAO.F_Name
inner join dbo.Film_Subtitle FSO on FA.F_Name = FSO.F_Name
inner join fadb.Film_Category FCR on FA.FID = FCR.FID inner join fadb.Category FC on FCR.CID = FC.CID
inner join fadb.Company FCOMP on FA.Comp_ID = FCOMP.Comp_ID
inner join fadb.Country FCOU on FA.Country_ID = FCOU.Country_ID
inner join fadb.Film_Critic FCRR on FA.FID = FCRR.FID inner join fadb.Critic FCRT on FCRR.CID = FCRT.CID
inner join fadb.Director FD on FA.DID = FD.DID
inner join fadb.Role FR on AA.AID = FR.AID where FA.F_Name = @Film_Name

exec All_Atributes_of_a_Film 'Django Unchained'

go
--13
create procedure Adding_Film_Criticise 
@F_Name varchar(30),
@C_UserName varchar(30),
@C_Comment text,
@C_Point int as
insert into fadb.Film_Critic (C_Comment,C_Point,FID,CID)
select C_Comment = @C_Comment, C_Point = @C_Point, fadb.Film.FID, fadb.Critic.CID from fadb.Film cross join fadb.Critic cross join fadb.Film_Critic 
where fadb.Film.F_Name = @F_Name and fadb.Critic.C_UserName = @C_UserName

go
--14
create procedure Display_byCompany 
@Comp_Name varchar(30) as
select Comp_Name, F_Name from fadb.Film 
inner join fadb.Company on fadb.Film.Comp_ID = fadb.Company.Comp_ID where Comp_Name = @Comp_Name

exec Display_byCompany 'Castle Rock Entertaintment'

go
--15
create procedure Display_byPoint
@minPoint int,
@maxPoint int as
select F_Name, F_CAvg, F_length, F_length, F_RDate from fadb.Film where F_CAvg between @minPoint and @maxPoint

exec Display_byPoint '80','95'

go