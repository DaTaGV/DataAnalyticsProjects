USE [EuropeanSoccer]
GO
/****** Object:  View [dbo].[vMatchPlayers]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 9th, 2022
|	VIEW TABLE
|	MATCH WITH PLAYERS
|   UNDERESTOOD DATA FOR NOT TECHNICAL END-USERS 
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE VIEW [dbo].[vMatchPlayers]
AS
SELECT 
	M.Season,
	M.Stage,
	YEAR(M.[Date]) AS [Year],
	Month(M.[Date]) AS [Month],
	M.[Date],
	T.Team,
	T.Country,
	T.League,
	P.Player,
	M.Country_Id,
	M.League_Id,
	M.Team_Id,
	FP.Player_Id,
	M.Match_api_id AS Match_id
FROM 
	FactMatch M INNER JOIN vTeam T
	 ON M.Team_Id = T.Team_Id 
	INNER JOIN FactMatchPlayers FP
	 ON M.Match_api_id = FP.Match_api_id
	AND M.Team_Id = FP.Team_Id
	INNER JOIN vPlayer P
	 ON FP.Player_Id = P.Player_Id
GO
