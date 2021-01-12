Create Database FilmArchiveDataBase

go

create schema fadb

go

create login fadblogin
with password = '1234',
default_database = FilmArchiveDataBase,
default_language = English,
check_expiration = on,
check_policy = on

go

CREATE TABLE fadb.Director
(
  DID INT NOT NULL IDENTITY(1,1),
  D_Fname VARCHAR(30) NOT NULL,
  D_Lname VARCHAR(30) NOT NULL,
  PRIMARY KEY (DID)
);

go

CREATE TABLE fadb.Category
(
  CID INT NOT NULL IDENTITY(1,1),
  C_Name VARCHAR(35) NOT NULL,
  PRIMARY KEY (CID),
  UNIQUE (C_Name)
);

go

CREATE TABLE fadb.Actor
(
  AID INT NOT NULL IDENTITY(1,1),
  A_FName VARCHAR(30) NOT NULL,
  A_LName VARCHAR(30) NOT NULL,
  PRIMARY KEY (AID)
);

go


CREATE TABLE fadb.Critic
(
  CID INT NOT NULL IDENTITY(1,1),
  C_UserName VARCHAR(30) NOT NULL,
  C_UserPass VARCHAR(120) NOT NULL,
  C_FName VARCHAR(30) NOT NULL,
  C_LName VARCHAR(30) NOT NULL,
  PRIMARY KEY (CID),
  UNIQUE (C_UserName)
);


go

CREATE TABLE fadb.Language
(
  LID INT NOT NULL IDENTITY(1,1),
  L_Name VARCHAR(30) NOT NULL,
  PRIMARY KEY (LID),
  UNIQUE (L_Name)
);

go


CREATE TABLE fadb.Country
(
  Country_ID INT NOT NULL IDENTITY(1,1),
  CountryName VARCHAR(30) NOT NULL,
  PRIMARY KEY (Country_ID),
  UNIQUE (CountryName)
);

go

CREATE TABLE fadb.Role
(
  RID INT NOT NULL IDENTITY(1,1),
  R_LName VARCHAR(30) NOT NULL,
  R_FName VARCHAR(30) NOT NULL,
  AID INT NOT NULL,
  PRIMARY KEY (RID),
  FOREIGN KEY (AID) REFERENCES fadb.Actor(AID)
);

go

CREATE TABLE fadb.Company
(
  Comp_ID INT NOT NULL IDENTITY(1,1),
  Comp_Name VARCHAR(30) NOT NULL,
  C_Budget Decimal(18,2) NULL,
  C_Revenue Decimal(18,2) NULL,
  PRIMARY KEY (Comp_ID),
  UNIQUE (Comp_Name)
);

go

CREATE TABLE fadb.Film
(
  FID INT NOT NULL IDENTITY(1,1),
  F_Name VARCHAR(60) NOT NULL,
  F_Desc TEXT NOT NULL,
  F_length TIME(0) NOT NULL,
  F_RDate DATE NOT NULL,
  F_CAvg INT NULL, 
  F_Budget Decimal(18,2) NOT NULL,
  F_Revenue Decimal(18,2) NOT NULL,
  DID INT NOT NULL,
  Country_ID INT NOT NULL,
  Comp_ID INT NOT NULL,
  PRIMARY KEY (FID),
  FOREIGN KEY (DID) REFERENCES fadb.Director(DID),
  FOREIGN KEY (Country_ID) REFERENCES fadb.Country(Country_ID),
  FOREIGN KEY (Comp_ID) REFERENCES fadb.Company(Comp_ID)
);

go


CREATE TABLE fadb.Film_Category
( 
  FCID INT NOT NULL IDENTITY(1,1),
  FID INT  NULL,
  CID INT  NULL,
  PRIMARY KEY (FCID),
  FOREIGN KEY (FID) REFERENCES fadb.Film(FID),
  FOREIGN KEY (CID) REFERENCES fadb.Category(CID)
);


go


CREATE TABLE fadb.Film_Actor
(
  FAID INT NOT NULL IDENTITY(1,1),
  FID INT  NULL,
  AID INT  NULL,
  PRIMARY KEY (FAID),
  FOREIGN KEY (FID) REFERENCES fadb.Film(FID),
  FOREIGN KEY (AID) REFERENCES fadb.Actor(AID)
);

go

CREATE TABLE fadb.Film_Critic
(
  FCID INT NOT NULL IDENTITY(1,1),
  C_Comment TEXT NULL,
  C_Point INT  NULL,
  FID INT  NULL,
  CID INT  NULL,
  PRIMARY KEY (FCID),
  FOREIGN KEY (FID) REFERENCES fadb.Film(FID),
  FOREIGN KEY (CID) REFERENCES fadb.Critic(CID),
  CHECK (C_Point BETWEEN 0 and 100)
);

go

CREATE TABLE fadb.Audio
(
  FLID INT NOT NULL IDENTITY(1,1),
  FID INT  NULL,
  LID INT  NULL,
  PRIMARY KEY (FLID),
  FOREIGN KEY (FID) REFERENCES fadb.Film(FID),
  FOREIGN KEY (LID) REFERENCES fadb.Language(LID)
);


go

CREATE TABLE fadb.Subtitle
(
  FLID INT NOT NULL IDENTITY(1,1),
  FID INT NULL,
  LID INT NULL,
  PRIMARY KEY (FLID),
  FOREIGN KEY (FID) REFERENCES fadb.Film(FID),
  FOREIGN KEY (LID) REFERENCES fadb.Language(LID)
 );
