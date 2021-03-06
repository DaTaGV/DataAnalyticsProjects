USE [EuropeanSoccer]
GO
/****** Object:  StoredProcedure [dbo].[spLeague]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 7th, 2022
|	STORED PROCEDURE
|	GET LEAGUE DATASET FROM THE SQLITE DATABASE
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE PROCEDURE [dbo].[spLeague]
AS
	SELECT 
	id AS League_Id,
	country_id, 
	CAST([name] AS VARCHAR(50)) AS [name]
	FROM OPENQUERY(SOCCER, 'SELECT id, country_id, name FROM LEAGUE') 

	UNION ALL

	SELECT 
	0 AS id,
	0 AS country_id,
	NULL AS [name]

	-- I added this SELECT statement showing a null Name because 
	-- I want to use a function in SSIS to check the column and return a 'Not Available' when it is NULL.
GO
