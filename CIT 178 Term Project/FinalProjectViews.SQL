{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf200
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 /*Final Project views\
\
USE FalloutFactions;\
GO\
\
View #1 Update\
\
\pard\pardeftab720\partightenfactor0

\f1\fs26 \cf0 \expnd0\expndtw0\kerning0
CREATE VIEW WeaponStrength\
AS\
SELECT Weapons#, Weapon, DPS\
FROM Weapons;\
GO\
\
SELECT * FROM WeaponStrength;\
\
GO\
UPDATE WeaponStrength\
SET DPS = 100\
WHERE Weapon#=2;\
GO\
\
View #2\
\
GO\
CREATE VIEW LeaderSTATS\
AS\
SELECT LeaderID, FirstName, LastName, Lvl, Charisma, Health\
FROM characters \
GO\
\
View #3\
\
GO\
CREATE VIEW FactionDangerLevel\
AS\
SELECT Faction, Activity\
FROM Factions\
GO\
\
View #4\
\
\pard\pardeftab720\partightenfactor0
\cf0 CREATE VIEW ClothingStrength\
AS\
SELECT ClothingID, Clothing, DamageResestence\
FROM Apparel\
GO*/\
}