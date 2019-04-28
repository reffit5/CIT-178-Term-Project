/*CREATE DATABASE FalloutFactions;

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

USE FalloutFactions

INSERT INTO WeaponType VALUES('Energy', '1')
INSERT INTO WeaponType VALUES('Rifle', '2')

INSERT INTO Weapons VALUES('7777','AEP7 Laser Pistol','72','1')
INSERT INTO Weapons VALUES('6666','Institute Pistol','99','1')
INSERT INTO Weapons VALUES('6668','Laser Musket','36','1')
INSERT INTO Weapons VALUES('4446','Railway Rifle','100','2')
INSERT INTO Weapons VALUES('1515','Assault Rifle','30','2')

INSERT INTO ClothingStyle VALUES('Light','1')
INSERT INTO ClothingStyle VALUES('Casual','2')
INSERT INTO ClothingStyle VALUES('Combat','3')

INSERT INTO Apparel VALUES('1','Elder Lyons Robe','3','2','1')
INSERT INTO Apparel VALUES('2','Fathers Lab Coat','2','2','1')
INSERT INTO Apparel VALUES('3','Minutemen Uniform','45','13','3')
INSERT INTO Apparel VALUES('4','Fatigues','0','2','2')
INSERT INTO Apparel VALUES('5','Combat Armor','59','22','3')*/

INSERT INTO Locations VALUES('Citadel','Ruins')
INSERT INTO Locations VALUES('CIT','City')
INSERT INTO Locations VALUES('Fort Independence','Ruins')
INSERT INTO Locations VALUES('Boston','Ruins')
INSERT INTO Locations VALUES('WasteLand','Ruins')

INSERT INTO Factions VALUES('Brotherhood of Steel','Unaggressive','Citadel')
INSERT INTO Factions VALUES('The Institute','Unaggressive','CIT')
INSERT INTO Factions VALUES('The Minutemen','Unaggressive','Fort Independence')
INSERT INTO Factions VALUES('The Railroad','Aggressive','Boston')
INSERT INTO Factions VALUES('Gunners','Very Aggressive','WasteLand')

INSERT INTO characters VALUES('2277','Owyn','Lyons','Male','75','25','9','150','Brotherhood of Steel','7777','1')
INSERT INTO characters VALUES('2287','Shaun','Father','Male','60','1','4','100','The Institute','6666','2')
INSERT INTO characters VALUES('2240','General','McGann','Male','62','36','5','125','The Minutemen','6668','3')
INSERT INTO characters VALUES('2260','Dez','Desdemona','Female','54','94','0','240','The Railroad','4446','4')
INSERT INTO characters VALUES('2250','Bullet','Gunner','Male','45','22','0','240','Gunners','1515','5')