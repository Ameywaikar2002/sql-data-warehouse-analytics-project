--- MEASURE VS DIMENSION
-- IF DATA TYPE IS NUMBER AND IT CAN BE CALCULATED THEN ITS A MEASURE OR ELSE ITS A DIMENSION

--EXPLORATORY DATA ANALYSIS

--1.DATABASE EXPLORATION
USE DataWarehouseAnalytics;

--exploring all the objects in the database
SELECT * FROM INFORMATION_SCHEMA.TABLES;

--exploring all the columns in the database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;
--------------------------------------------------------