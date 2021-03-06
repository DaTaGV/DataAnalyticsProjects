USE [EuropeanSoccer]
GO
/****** Object:  StoredProcedure [dbo].[spCountry]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 7th, 2022
|	STORED PROCEDURE
|	GET COUNTRY DATASET FROM THE SQLITE DATABASE
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE PROCEDURE [dbo].[spCountry]
AS
	SELECT 
	id, 
	CAST([name] AS VARCHAR(50)) AS [name]
	FROM OPENQUERY(SOCCER, 'SELECT id, name FROM COUNTRY') 

	UNION ALL

	SELECT 
	9999 AS id,
	NULL AS [name]

	-- I added this SELECT statement showing a null Name because 
	-- I want to use a function in SSIS to check the column and return a 'Not Available' when it is NULL.
GO
