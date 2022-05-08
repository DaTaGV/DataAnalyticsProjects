USE [EuropeanSoccer]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGlobalResult]    Script Date: 08/05/2022 15:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 8th, 2022
|	USER FUNCTION
|	INDICATE IF THE TEAM WIN LOSE OR DRAW THE MATCH
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE FUNCTION [dbo].[fnGlobalResult] 
(
	@ScoreHome AS INT ,
	@ScoreAway AS INT
)
RETURNS VARCHAR(4)
AS
BEGIN
	RETURN (CASE WHEN @ScoreHome > @ScoreAway THEN 'Win' ELSE
				(CASE WHEN @ScoreHome = @ScoreAway THEN 'Draw' ELSE 'Lose' END)
			END)
END
GO
