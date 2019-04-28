{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf200
{\fonttbl\f0\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 /*Final Project Procedures Kameron Reffitt\
\
1)\
\
USE FalloutFactions;\
GO\
CREATE PROC spLeaders\
AS\
SELECT * FROM characters\
ORDER BY Level;\
GO\
\
EXEC spLeaders;\
\
2)\
\
USE FalloutFactions;\
Go\
CREATE PROC spGetLeader\
		@LeaderID int\
AS\
BEGIN\
		SELECT * FROM characters\
		WHERE LeaderID = @LeaderID;\
END\
GO\
EXEC spGetLeader 1;\
\
3)\
\
USE FalloutFactions;\
GO\
CREATE PROC spLeaderStats\
	@LeaderID int,\
	@FirstName varchar(15) OUTPUT,\
	@Charisma int OUTPUT,\
	@Lvl int OUTPUT\
AS\
SELECT @FirstName = FirstName, @Charisma = Charisma, @Lvl = Lvl\
FROM characters\
WHERE LeaderID = @LeaderID;\
GO\
\
DECLARE @FirstName varchar(15);\
DECLARE  @Charisma int;\
DECLARE @Lvl int;\
EXEC spLeaderStats 3, @FirstName OUTPUT, @Charisma OUTPUT, @Lvl OUTPUT;\
SELECT @FirstName AS \'91First Name\'92, @Charisma AS \'91Charisma\'92, @Lvl AS \'91Level\'92;\
\
4)\
\
\pard\pardeftab720\partightenfactor0
\cf0 \expnd0\expndtw0\kerning0
USE FalloutFactions;\
GO\
CREATE PROC spLocationCount\
AS\
DECLARE @LocationCount int;\
SELECT @LocationCount = COUNT(*)\
FROM Locations \
RETURN @LocationCount;\
GO\
\
DECLARE @LocationCount int;\
EXEC @LocationCount = spLocationCount;\
PRINT 'There are ' + CONVERT(varchar, @LocationCount) + ' Locations in your database';\
GO\
\
Final Project User Defined Functions\
\
5)\
\
\pard\pardeftab720\partightenfactor0
\cf0 USE FalloutFactions;\
GO\
CREATE FUNCTION fnGetWeapon\
    (@WeaponName varchar(20) = '%')\
    RETURNS int\
BEGIN\
    RETURN (SELECT Weapon# FROM Weapons WHERE Weapon Like @WeaponName);\
END; \
\
6)\
\
USE FalloutFactions;\
GO\
CREATE FUNCTION fnLeaderInfo\
	(@LeaderName varchar(15) = '%')\
	RETURNS table\
RETURN\
	(SELECT * FROM characters WHERE LeaderName LIKE @LeaderName);\
GO\
SELECT * FROM dbo.fnLeaderInfo(\'91%B%\'92);\
\
Final Project Triggers\
\
\'97-create archive\'97-\
\
USE FalloutFactions;\
 GO\
 SELECT * INTO FactionsArchive\
 FROM Factions\
 WHERE 1=0;\
\
ALTER TABLE FactionsArchive\
 ADD Act varchar(50);\
 GO\
\
7)\
\
CREATE TRIGGER FactionsArchive_Delete ON Factions\
    AFTER DELETE\
AS\
BEGIN\
    SET NOCOUNT ON;\
	DECLARE @Faction varchar(30)\
	DECLARE @Activity varchar(20)\
	DECLARE @Locations varchar(35)\
\
    SELECT @Faction =DELETED.Faction, @Activity = DELETED.Activity, @Locations = DELETED.Locations,\
		FROM DELETED\
\
    INSERT INTO FactionsArchive VALUES(@Faction,@Activity, @Locations, 'Deleted' )\
END\
GO\
\
8)\
\
CREATE TRIGGER FactionsArchive_INSERT ON Factions\
    AFTER INSERT\
AS\
BEGIN\
    SET NOCOUNT ON;\
	DECLARE @Faction varchar(30)\
	DECLARE @Activity varchar(20)\
	DECLARE @Locations varchar(35)\
\
SELECT @Faction =INSERTED.Faction, @Activity = INSERTED.Activity, @Location = INSERTED.Location\
	FROM INSERTED	\
INSERT INTO FactionsArchive VALUES(@Faction,@Activity, @Location, 'Inserted' )\
END\
GO\
INSERT INTO Factions VALUES(Children of Atom,\'92Aggressive\'92,\'92The Storm\'92,'NULL');\
GO\
\
SELECT * FROM FactionsArchive;\
GO\
\
9)\
\
CREATE TRIGGER FactionsArchive_Update ON Factions\
    AFTER UPDATE\
AS\
BEGIN\
    SET NOCOUNT ON;\
	DECLARE @Faction varchar(30)\
	DECLARE @Activity varchar(20)\
	DECLARE @Locations varchar(35)\
\
    SELECT @Faction =INSERTED.Faction, @Activity = INSERTED.Activity, @Locations = INSERTED.Locations,\
		FROM INSERTED\
INSERT INTO FactionsArchive VALUES(@Faction,@Activity, @Locations,'Updated' )\
END\
GO\
*/\
}