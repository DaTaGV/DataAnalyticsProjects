USE [EuropeanSoccer]
GO
/****** Object:  View [dbo].[vMatch]    Script Date: 09/05/2022 9:47:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 9th, 2022
|	VIEW TABLE
|	MATCH
|   UNDERESTANDING DATA FOR NOT TECHNICAL END-USERS 
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE VIEW [dbo].[vMatch]
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
	M.Home_Away_Indicator AS Ground,
	M.Goal,
	M.GlobalResult	
FROM 
	FactMatch M INNER JOIN vTeam T
	 ON M.Team_Id = T.Team_Id 
GO
