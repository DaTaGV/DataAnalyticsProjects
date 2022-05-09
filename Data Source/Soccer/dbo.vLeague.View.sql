USE [EuropeanSoccer]
GO
/****** Object:  View [dbo].[vLeague]    Script Date: 09/05/2022 9:47:03 ******/
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
	L.[Name] AS Country
FROM 
	DimLeague L
GO
