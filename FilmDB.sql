Create Database FilmArchiveDB

Go


CREATE TABLE Director
(
  DID INT NOT NULL IDENTITY(1,1),
  D_Fname VARCHAR(25) NOT NULL,
  D_Lname VARCHAR(30) NOT NULL,
  D_Fcount INT NULL,
  PRIMARY KEY (DID)
);

CREATE TABLE Category
(
  CID INT NOT NULL IDENTITY(1,1),
  C_Name VARCHAR(35) NOT NULL,
  PRIMARY KEY (CID),
  UNIQUE (C_Name)
);


CREATE TABLE Actor
(
  AID INT NOT NULL IDENTITY(1,1),
  A_FName VARCHAR(30) NOT NULL,
  A_LName VARCHAR(35) NOT NULL,
  PRIMARY KEY (AID)
);


CREATE TABLE Critic
(
  CID INT NOT NULL IDENTITY(1,1),
  C_UserName VARCHAR(25) NOT NULL,
  C_UserPass VARCHAR(60) NOT NULL,
  C_FName VARCHAR(30) NOT NULL,
  C_LName VARCHAR(35) NOT NULL,
  PRIMARY KEY (CID),
  UNIQUE (C_UserName)
);

CREATE TABLE Language
(
  LID INT NOT NULL IDENTITY(1,1),
  L_Name VARCHAR(35) NOT NULL,
  PRIMARY KEY (LID),
  UNIQUE (L_Name)
);

CREATE TABLE Country
(
  Country_ID INT NOT NULL IDENTITY(1,1),
  CountryName INT NOT NULL,
  PRIMARY KEY (Country_ID),
  UNIQUE (CountryName)
);


CREATE TABLE Role
(
  RID INT NOT NULL IDENTITY(1,1),
  R_LName VARCHAR(35) NOT NULL,
  R_FName VARCHAR(30) NOT NULL,
  R_Desc TEXT NOT NULL,
  AID INT NOT NULL,
  PRIMARY KEY (RID),
  FOREIGN KEY (AID) REFERENCES Actor(AID)
);


CREATE TABLE Company
(
  Comp_ID INT NOT NULL IDENTITY(1,1),
  Comp_Name VARCHAR(30) NOT NULL,
  Comp_Budget Decimal(18,2) NOT NULL,
  Comp_Revenue Decimal(18,2) NOT NULL,
  PRIMARY KEY (Comp_ID)
);


CREATE TABLE Film
(
  FID INT NOT NULL IDENTITY(1,1),
  F_Name VARCHAR(35) NOT NULL,
  F_Desc TEXT NOT NULL,
  F_length TIME NOT NULL,
  F_RDate DATE NOT NULL,
  F_CAvg INT NULL, 
  F_Budget Decimal(18,2) NOT NULL,
  F_Revenue Decimal(18,2) NOT NULL,
  DID INT NOT NULL,
  Country_ID INT NOT NULL,
  Comp_ID INT NOT NULL,
  PRIMARY KEY (FID),
  FOREIGN KEY (DID) REFERENCES Director(DID),
  FOREIGN KEY (Country_ID) REFERENCES Country(Country_ID),
  FOREIGN KEY (Comp_ID) REFERENCES Company(Comp_ID)
);

CREATE TABLE Film_Category
( 
  FCID INT NOT NULL IDENTITY(1,1),
  FID INT  NULL,
  CID INT  NULL,
  PRIMARY KEY (FCID),
  FOREIGN KEY (FID) REFERENCES Film(FID),
  FOREIGN KEY (CID) REFERENCES Category(CID)
);

CREATE TABLE Film_Actor
(
  FAID INT NOT NULL IDENTITY(1,1),
  FID INT  NULL,
  AID INT  NULL,
  PRIMARY KEY (FAID),
  FOREIGN KEY (FID) REFERENCES Film(FID),
  FOREIGN KEY (AID) REFERENCES Actor(AID)
);


CREATE TABLE Critisize_by
(
  FCID INT NOT NULL IDENTITY(1,1),
  C_Comment TEXT NULL,
  C_Point INT  NULL,
  FID INT  NULL,
  CID INT  NULL,
  PRIMARY KEY (FCID),
  FOREIGN KEY (FID) REFERENCES Film(FID),
  FOREIGN KEY (CID) REFERENCES Critic(CID),
  CONSTRAINT check_C_Point
  CHECK (C_Point BETWEEN 0 and 100)
);

CREATE TABLE Dubbing
(
  FLID INT NOT NULL IDENTITY(1,1),
  FID INT  NULL,
  LID INT  NULL,
  PRIMARY KEY (FLID),
  FOREIGN KEY (FID) REFERENCES Film(FID),
  FOREIGN KEY (LID) REFERENCES Language(LID)
);

CREATE TABLE Subtitle
(
  FLID INT NOT NULL IDENTITY(1,1),
  FID INT NULL,
  LID INT NULL,
  PRIMARY KEY (FLID),
  FOREIGN KEY (FID) REFERENCES Film(FID),
  FOREIGN KEY (LID) REFERENCES Language(LID)

