USE [EuropeanSoccer]
GO
/****** Object:  StoredProcedure [dbo].[spFactMatch]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 7th, 2022
|	STORED PROCEDURE
|	GET FACT MATCH DATASET FROM THE SQLITE DATABASE
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE PROCEDURE [dbo].[spFactMatch](@HomeAway AS VARCHAR(4), @YearMonth AS VARCHAR(6))
AS

	DECLARE @QRY AS VARCHAR(MAX)
	DECLARE @Indicator AS VARCHAR(16)
	DECLARE @GolIndicator AS VARCHAR(14)
	
	SET @Indicator = dbo.fnHomeAwayIndicator(@HomeAway)
	SET @GolIndicator = dbo.fnGoalHomeAwayIndicator(@HomeAway)

	TRUNCATE TABLE TEMP_MATCH;

	SET @QRY = 
			'
			INSERT INTO TEMP_MATCH 
			SELECT 
			 country_id, 
			 league_id,
			 season,
			 stage,
			 [date],
			 Team_Id, 
			 ''' + @HomeAway +  ''' AS Home_Away_Indicator,
			 Goals,
			 dbo.fnDateKey([date]) as DateKey, 
			 Match_api_id,
			 (CASE WHEN ''' + @HomeAway +  ''' = ''Home'' THEN dbo.fnGlobalResult(home_team_goal,away_team_goal) 
			 ELSE dbo.fnGlobalResult(away_team_goal, home_team_goal) END) AS GlobalResult 
			FROM 
			OPENQUERY(SOCCER,
			''
			SELECT 
				country_id, 
				league_id,
				season,
				stage,
				DATE(date) AS date,
				' + @Indicator +  ' AS Team_Id, 
				' + @GolIndicator +  ' AS Goals,
				match_api_id,
				home_team_goal,
				away_team_goal 
			FROM MATCH 
			WHERE strftime(''''%Y%m'''', date) = ''''' + @YearMonth  + '''''
			'')'

	--EXEC(@QRY)
	--SELECT @QRY
	exec sp_sqlexec @QRY;

	SELECT * FROM TEMP_MATCH

GO
