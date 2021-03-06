USE [EuropeanSoccer]
GO
/****** Object:  StoredProcedure [dbo].[spTeam]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 7th, 2022
|	STORED PROCEDURE
|	GET TEAM DATASET FROM THE SQLITE DATABASE
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE PROCEDURE [dbo].[spTeam]
AS
	SELECT 
	team_api_id, 
	CAST(team_long_name AS VARCHAR(50)) AS team_long_name, 
	CAST(team_long_name AS VARCHAR(3)) AS team_short_name,
	country_id,
	league_id 
	FROM OPENQUERY(SOCCER, 
	'
	SELECT 
	T.team_api_id, 
	T.team_long_name, 
	T.team_short_name,
	M.country_id,
	M.league_id 
	FROM TEAM T INNER JOIN  
	(
		SELECT DISTINCT 
			country_id,
			league_id,
			home_team_api_id
		FROM MATCH Mt
	) M
	ON T.team_api_id = M.home_team_api_id 
	ORDER BY 1 
	') 

	UNION ALL

	SELECT 
	0 AS team_api_id, 
	NULL AS team_long_name, 
	NULL AS team_short_name,
	0 AS country_id,
	0 AS league_id

	-- I added this SELECT statement showing a null Name because 
	-- I want to use a function in SSIS to check the column and return a 'Not Available' when it is NULL.
GO
