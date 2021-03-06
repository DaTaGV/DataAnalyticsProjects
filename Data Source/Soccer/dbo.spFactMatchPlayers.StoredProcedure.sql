USE [EuropeanSoccer]
GO
/****** Object:  StoredProcedure [dbo].[spFactMatchPlayers]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 8th, 2022
|	STORED PROCEDURE
|	GET FACT MATCH DATASET FROM THE SQLITE DATABASE
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE PROCEDURE [dbo].[spFactMatchPlayers](@HomeAway AS VARCHAR(4), @YearMonth AS VARCHAR(6))
AS

	DECLARE @QRY AS VARCHAR(MAX)

	TRUNCATE TABLE TEMP_MATCH_PLAYERS;

	SET @QRY = 
			'
			INSERT INTO TEMP_MATCH_PLAYERS 
			SELECT 
			 country_id, 
			 league_id,
			 ' + @HomeAway +  '_team_api_id AS Team_Id, 
			 players, 
			 ''' + @HomeAway +  ''' AS Home_Away_Indicator, 
			 match_api_id 
			FROM
			(
				SELECT 
				country_id, 
				league_id,
				' + @HomeAway +  '_team_api_id,
				player_1, 
				player_2, 
				player_3,
				player_4,
				player_5,
				player_6,
				player_7,
				player_8,
				player_9,
				player_10,
				player_11,
				match_api_id
				FROM 
				OPENQUERY(SOCCER,
				''
				SELECT 
					country_id, 
					league_id,
					' + @HomeAway +  '_team_api_id,
					' + @HomeAway +  '_player_1 AS player_1, 
					' + @HomeAway +  '_player_2 AS player_2, 
					' + @HomeAway +  '_player_3 AS player_3,
					' + @HomeAway +  '_player_4 AS player_4,
					' + @HomeAway +  '_player_5 AS player_5,
					' + @HomeAway +  '_player_6 AS player_6,
					' + @HomeAway +  '_player_7 AS player_7,
					' + @HomeAway +  '_player_8 AS player_8,
					' + @HomeAway +  '_player_9 AS player_9,
					' + @HomeAway +  '_player_10 AS player_10,
					' + @HomeAway +  '_player_11 AS player_11,
					match_api_id
				FROM MATCH 
				WHERE strftime(''''%Y%m'''', date) = ''''' + @YearMonth  + '''''  '')
			) p 
			UNPIVOT 
			(
				players FOR [column] 
					IN (player_1, player_2, player_3, player_4, player_5, player_6, player_7, player_8, player_9, player_10, player_11)
			) AS unpvt 
			'

	exec sp_sqlexec @QRY
GO
