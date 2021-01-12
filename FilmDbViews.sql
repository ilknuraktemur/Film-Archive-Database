--1
create view Display_Film_Actor as 
select fadb.Film.F_Name, fadb.Actor.A_FName, fadb.Actor.A_LName from fadb.Actor
inner join fadb.Film_Actor
on (fadb.Film_Actor.AID = Actor.AID) inner join fadb.Film on (fadb.Film_Actor.FID= fadb.Film.FID)

select * from display_film_Actor

go
--2
create view Film_Subtitle as
select F_Name, L_Name as 'Subtitle' from fadb.Film k1
inner join fadb.Subtitle k2 on k1.FID = k2.FID inner join fadb.Language k3 on k2.LID=k3.LID

go 
--3
create view Film_Audio as
select F_Name, L_Name as 'Audio' from fadb.Film k1
inner join fadb.Audio k2 on k1.FID = k2.FID inner join fadb.Language k3 on k2.LID=k3.LID

go
--4
create view Watching_Option as
select k1.F_Name, Subtitle, Audio from Film_Audio k1
inner join Film_Subtitle k2 on k1.F_Name= k2.F_Name

select * from Watching_Option

go
--5
create view Display_Film_Actor_Roles as
select F_Name, concat(R_LName, ' ',R_FNAme) as Role_Name, concat(A_fName, ' ' ,A_LName) as Actor_Name from fadb.Role
inner join fadb.Film_Actor on Film_Actor.AID =  fadb.Role.AID inner join fadb.Film 
on Film.FID = Film_Actor.FID inner join fadb.Actor on Actor.AID = Film_Actor.AID


select * from Display_Film_Actor_Roles

go
--6
create view Display_Film_Category as 
select fadb.Film.F_Name, fadb.Category.C_Name from fadb.Film
inner join fadb.Film_Category
on (fadb.Film_Category.FID = Film.FID) inner join fadb.Category on (fadb.Film_Category.CID= fadb.Category.CID)

select * from Display_Film_Category

go

--7
create view display_comments as
select concat(C_FName, ' ', C_LName) as Critic_Name , f_name,C_Comment, C_Point from fadb.Film k1 
inner join fadb.Film_Critic k2 on k1.FID=k2.FID 
inner join fadb.Critic k3 on k2.CID=k3.CID

select * from dbo.display_comments

go

--8

create view All_Attributes_of_Films as
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
inner join fadb.Role FR on AA.AID = FR.AID

select * from All_Attributes_of_Films

go
--9
create view Display_Company_Films as
select Comp_Name, F_Name from fadb.Film 
inner join fadb.Company on fadb.Film.Comp_ID = fadb.Company.Comp_ID

select * from Display_Company_Films

go
--10
create view Display_Perfect_Films as
select F_Name from fadb.Film where F_CAvg = 100

select * from Display_Perfect_Films

go