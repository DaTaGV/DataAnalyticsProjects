USE [EuropeanSoccer]
GO
/****** Object:  UserDefinedFunction [dbo].[vMatchInfo]    Script Date: 09/05/2022 16:15:38 ******/
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

CREATE FUNCTION [dbo].[vMatchInfo] (@Ground VARCHAR(4))
RETURNS TABLE
AS
RETURN
   SELECT 
		T.Match_id,
		T.Team,
		T.GlobalResult,
		T.Goal
	FROM vMatch T
	WHERE T.Ground = @Ground;
GO
