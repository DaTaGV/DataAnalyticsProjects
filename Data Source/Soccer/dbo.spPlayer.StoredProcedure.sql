USE [EuropeanSoccer]
GO
/****** Object:  StoredProcedure [dbo].[spPlayer]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 7th, 2022
|	STORED PROCEDURE
|	GET PLAYER DATASET FROM THE SQLITE DATABASE
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE PROCEDURE [dbo].[spPlayer]
AS
	SELECT 
	player_api_id, 
	CAST(player_name AS VARCHAR(60)) AS player_name, 
	CAST(birthday AS DATETIME2) AS birthday, 
	height, 
	[weight],
	dbo.fnDateKey(birthday) as DateKey
	FROM OPENQUERY(SOCCER, 'SELECT player_api_id, player_name, DATE(birthday) AS birthday, height, weight FROM PLAYER') 

	UNION ALL

	SELECT 
	0 AS player_api_id, 
	NULL AS player_name, 
	CAST('1900-01-01' AS DATETIME2) AS birthday, 
	0 AS height, 
	0 AS [weight],
	19000101 AS DateKey

	-- I added this SELECT statement showing a null Name because 
	-- I want to use a function in SSIS to check the column and return a 'Not Available' when it is NULL.
GO
