/*CREATE DATABASE FalloutFactions;*/

USE FalloutFactions;

CREATE TABLE WeaponType(
Type varchar(15),
TypeID int PRIMARY KEY
);

CREATE TABLE Weapons(
WeaponID int PRIMARY KEY,
Weapon varchar(20),
DPS int,
TypeID INT FOREIGN KEY REFERENCES WeaponType(TypeID)
);

CREATE TABLE ClothingStyle(
Name varchar(15),
ClothingType int PRIMARY KEY
);

CREATE TABLE Apparel(
ClothingID int PRIMARY KEY,
Clothing varchar(20),
DamageResestence int,
Weight int,
ClothingType int FOREIGN KEY REFERENCES ClothingStyle(ClothingType)
);

CREATE TABLE Locations(
Locations varchar(35) PRIMARY KEY,
Enviroment varchar(10)
);

CREATE TABLE Factions(
Faction varchar(30) PRIMARY KEY,
Activity varchar (20),
Locations varchar (35) FOREIGN KEY REFERENCES Locations(Locations)
);

CREATE TABLE characters(
LeaderID int PRIMARY KEY NOT NULL,
FirstName varchar(15),
LastName varchar(15) NOT NULL,
Gender varchar (10) Not Null,
Age int NOT NULL,
Lvl int NOT NULL,
Charisma int,
Health int NOT NULL,
Faction varchar(30) FOREIGN KEY REFERENCES Factions(Faction),
WeaponID INT FOREIGN KEY REFERENCES Weapons(WeaponID),
ClothingID INT FOREIGN KEY REFERENCES Apparel(ClothingID)
);
