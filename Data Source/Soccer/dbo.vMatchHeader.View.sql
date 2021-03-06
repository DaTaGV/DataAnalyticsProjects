USE [EuropeanSoccer]
GO
/****** Object:  View [dbo].[vMatchHeader]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 9th, 2022
|	VIEW
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE VIEW [dbo].[vMatchHeader]
AS
SELECT DISTINCT
	M.Match_id,
	M.League_Id,
	M.Season,
	M.Stage,
	M.Year,
	M.Month,
	M.Date,
	M.Country,
	M.League,
	H.Team AS Home_Team,
	A.Team AS Away_Team,
	'Home' AS Home_Ground,
	'Away' AS Away_Ground,
	H.Goal AS Home_Goal,
	A.Goal AS Away_Goal,
	H.GlobalResult AS Home_GlobalResult,
	A.GlobalResult AS Away_GlobalResult
FROM vMatch M INNER JOIN vMatchInfo('Home') H
 ON M.Match_id = H.Match_id

INNER JOIN vMatchInfo('Away') A
 ON M.Match_id = A.Match_id
GO
