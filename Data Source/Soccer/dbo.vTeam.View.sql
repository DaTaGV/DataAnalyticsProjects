USE [EuropeanSoccer]
GO
/****** Object:  View [dbo].[vTeam]    Script Date: 09/05/2022 9:47:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 9th, 2022
|	VIEW TABLE
|	JOIN COUNTRY, LEAGUE AND TEAM TO OBTEIN  
|   UNDERESTANDING DATA FOR NOT TECHNICAL END-USERS 
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE VIEW [dbo].[vTeam]
AS
SELECT 
	T.Team_Id,
	T.[Name] AS Team,
	C.[Name] AS Country,
	L.[Name] AS League,
	1 AS CountTeams
FROM 
	DimCountry C INNER JOIN DimLeague L
	 ON C.Country_Id = L.Country_Id

	INNER JOIN DimTeam T
	 ON T.Country_id = C.Country_Id
	AND T.League_id = L.League_Id
GO
