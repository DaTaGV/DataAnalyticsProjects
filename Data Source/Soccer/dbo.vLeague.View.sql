USE [EuropeanSoccer]
GO
/****** Object:  View [dbo].[vLeague]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 9th, 2022
|	VIEW TABLE
|	LEAGUE
|   UNDERESTANDING DATA FOR NOT TECHNICAL END-USERS 
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE VIEW [dbo].[vLeague]
AS
SELECT 
	L.League_Id,
	L.[Name] AS League,
	L.Country_Id
FROM 
	DimLeague L
GO
