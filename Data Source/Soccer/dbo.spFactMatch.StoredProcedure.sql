USE [EuropeanSoccer]
GO
/****** Object:  StoredProcedure [dbo].[spFactMatch]    Script Date: 07/05/2022 17:16:00 ******/
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

CREATE PROCEDURE [dbo].[spFactMatch](@HomeAway AS VARCHAR(4))
AS

	DECLARE @QRY AS VARCHAR(MAX)
	DECLARE @Indicator AS VARCHAR(16)
	DECLARE @GolIndicator AS VARCHAR(14)

	SET @Indicator = dbo.fnHomeAwayIndicator(@HomeAway)
	SET @GolIndicator = dbo.fnGoalHomeAwayIndicator(@HomeAway)

	SET @QRY = 
			'SELECT TOP 2 
			 country_id, 
			 league_id,
			 season,
			 stage,
			 [date],
			 Team_Id, 
			 Goals,
			 dbo.fnDateKey([date]) as DateKey, 
			 Match_api_id
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
				match_api_id 
			FROM MATCH 
			WHERE COUNTRY_ID = 21518 AND SEASON = ''''2015/2016'''' AND HOME_TEAM_API_ID = 8633 AND STAGE = 2
			'')'

	EXEC(@QRY)
GO
