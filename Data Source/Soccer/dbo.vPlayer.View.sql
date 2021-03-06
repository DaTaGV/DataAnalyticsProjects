USE [EuropeanSoccer]
GO
/****** Object:  View [dbo].[vPlayer]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 9th, 2022
|	VIEW TABLE
|	PLAYER
|   UNDERESTANDING DATA FOR NOT TECHNICAL END-USERS 
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE VIEW [dbo].[vPlayer]
AS
SELECT 
	P.Player_Id,
	P.[Name] AS Player
FROM 
	DimPlayer P
GO
