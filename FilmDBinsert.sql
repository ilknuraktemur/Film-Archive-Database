use FilmArchiveDataBase

insert fadb.Director values ( 'Quentin', 'Tarantino')
insert fadb.Director values ( 'Frank', 'Darabont')

select * from fadb.Director

insert fadb.Country values ( 'America')

select * from fadb.Country

insert fadb.Company values ( 'Columbia Pictures Corporation')

select * from fadb.Film

insert fadb.Film values ('Django Unchained','With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', '02:45:00', '2012-12-25' ,Null, '100000000', '425368238', '1', '1', '1')
insert fadb.Film values ('The Shawshank Redemption','Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', '02:22:00', '1994-09-23' ,Null, '25000000', '28341469', '2', '1', '1')

select * from fadb.Actor

insert fadb.Actor values ('Jamie','Foxx')
insert fadb.Actor values ('Christoph','Waltz')
insert fadb.Actor values ('Leonardo','DiCaprio')
insert fadb.Actor values ('Kerry','Washington')
insert fadb.Actor values ('Samuel L.','Jackson')
insert fadb.Actor values ('Walton','Goggins')
insert fadb.Actor values ('Tim','Robbins')
insert fadb.Actor values ('Morgan','Freeman')
insert fadb.Actor values ('Bob','Gunton')
insert fadb.Actor values ('William','Sadler')
insert fadb.Actor values ('Clancy','Brown')
insert fadb.Actor values ('Gil','Bellows')
insert fadb.Actor values ('Mark','Rolston')



declare @F_Name varchar(30)


insert into fadb.Film_Actor (AID) 
select AID from fadb.Actor where AID > 6



declare @FID int 
declare @Fname varchar(30)  = 'The Shawshank Redemption'
set @FID = (select FID from fadb.Film  where F_name = @FName )
UPDATE fadb.Film_Actor
SET FID = (select FID from fadb.Film where FID = @FID) where FID is null





update fadb.Film_Actor
set FID = case when FID is null then (select FID from fadb.Film where FID = 2)


select * from fadb.Film_Actor

insert fadb.Language values ('English')
insert fadb.Language values ('Turkish')
insert fadb.Language values ('Arabic')
insert fadb.Language values ('Spanish')
insert fadb.Language values ('German')
insert fadb.Language values ('Greek')
insert fadb.Language values ('Russian')
insert fadb.Language values ('Korean')
insert fadb.Language values ('French')

select * from fadb.Language


insert fadb.Country values ('America')
insert fadb.Country values ('India')
insert fadb.Country values ('England')
insert fadb.Country values ('Turkey')
insert fadb.Country values ('Korean')
insert fadb.Country values ('Germany')
insert fadb.Country values ('France')
insert fadb.Country values ('Brazil')
insert fadb.Country values ('Spain')
insert fadb.Country values ('Japan')

select * from fadb.Country

alter table fabd.Country
alter column CountryName Varchar(30) Not null


ALTER TABLE Country 
ADD CONSTRAINT UQ__Country__E056F201671DC989 UNIQUE (CountryName)

insert fadb.Category values ('Action')
insert fadb.Category values ('Adventure')
insert fadb.Category values ('Animation')
insert fadb.Category values ('Biography')
insert fadb.Category values ('Comedy')
insert fadb.Category values ('Crime')
insert fadb.Category values ('Documentary')
insert fadb.Category values ('Drama')
insert fadb.Category values ('Family')
insert fadb.Category values ('Fantasy')
insert fadb.Category values ('Film Noir')
insert fadb.Category values ('History')
insert fadb.Category values ('Music')
insert fadb.Category values ('Musical')
insert fadb.Category values ('Mystery')
insert fadb.Category values ('Romance')
insert fadb.Category values ('Sci-Fi')
insert fadb.Category values ('Short')
insert fadb.Category values ('Sport')
insert fadb.Category values ('Superhero')
insert fadb.Category values ('Thriller')
insert fadb.Category values ('War')
insert fadb.Category values ('Western')

select * from fadb.Category


insert fadb.Company values ('Castle Rock Entertaintment')
insert fadb.Company values ('Böcek Yapım')
insert fadb.Company values ('Paramount Pictures')
insert fadb.Company values ('Miramax')
insert fadb.Company values ('Fox 2000 Pictures')
insert fadb.Company values ('New Line Cinema')
insert fadb.Company values ('Warner Bros')


select * from fadb.Company

select * from fadb.Critic

insert fadb.Critic values ('INathan','123456','Ian','Nathan')
insert fadb.Critic values ('MWilmington','123456','Michael','Wilmington')
insert fadb.Critic values ('MClark','123456','Mike','Clark')
insert fadb.Critic values ('REbart','123456','Roger','Ebart')
insert fadb.Critic values ('TMcCarthy','123456','Todd','McCarthy')
insert fadb.Critic values ('AHornaday','123456','Ann','Hornaday')
insert fadb.Critic values ('JBerardinelli','123456','James','Berardinelli')
insert fadb.Critic values ('VCanby','123456','Vincent','Canby')
insert fadb.Critic values ('RWells','123456','Ron','Wells')
insert fadb.Critic values ('JRosenbaum','123456','Jonathan','Rosenbaum')
insert fadb.Critic values ('ALane','123456','Anthony','Lane')
insert fadb.Critic values ('JWilliams','123456','Joe','Williams')
insert fadb.Critic values ('RReed','123456','Rex','Reed')


insert fadb.Audio values ('1','1')
insert fadb.Audio values ('1','2')
insert fadb.Audio values ('1','9')
insert fadb.Audio values ('3','1')
insert fadb.Audio values ('3','2')
insert fadb.Audio values ('3','7')

select * from fadb.Audio

insert fadb.Subtitle values ('1','2')
insert fadb.Subtitle values ('1','3')
insert fadb.Subtitle values ('1','6')
insert fadb.Subtitle values ('1','8')
insert fadb.Subtitle values ('3','1')
insert fadb.Subtitle values ('3','4')
insert fadb.Subtitle values ('3','2')
insert fadb.Subtitle values ('3','6')

select * from fadb.Subtitle

select * from fadb.Actor


insert fadb.Role values ('Django','Unchained','1')
insert fadb.Role values ('Dr. King','Schultz','2')
insert fadb.Role values ('Calvin','Candie','3')
insert fadb.Role values ('Broomhilda von','Shaft','4')
insert fadb.Role values ('Stephen','Untitled','5')
insert fadb.Role values ('Billy','Crash','6')
insert fadb.Role values ('Andy','Dufresne','7')
insert fadb.Role values ('Ellis Boyd','Redding','8')
insert fadb.Role values ('Warden','Norton','9')
insert fadb.Role values ('Heywood',' ','10')
insert fadb.Role values ('Captain','Hadley','11')
insert fadb.Role values ('Tommy',' ','12')

select * from fadb.Film_Critic
select * from fadb.Critic
select * from fadb.Film

insert fadb.Film_Critic values ('What Tarantino has is an appreciation for gut-level exploitation film appeal, combined with an artists desire to transform that gut element with something higher, better, more daring. His films challenge taboos in our society in the most direct possible way, and at the same time add an element of parody or satire.', '100', '1', '4')
insert fadb.Film_Critic values ('Only Tarantino could come up with such a wild cross-cultural mash, a smorgasbord of ingredients stemming from spaghetti Westerns, German legend, historical slavery, modern rap music, proto-Ku Klux Klan fashion, an assembly of 60s and 70s character actors and a leading couple meant to be the distant forebears of blaxploitation hero John Shaft and make it not only digestible but actually pretty delicious.', '80', '1', '5')
insert fadb.Film_Critic values ('A thumpingly good ode to friendship, hope, wit, wiles and wisdom, brimming with crackling characters and topped with the most twisteroo of twists since "The Crying Game', '100', '3', '1')


