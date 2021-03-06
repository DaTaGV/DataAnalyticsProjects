USE [EuropeanSoccer]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGlobalResult]    Script Date: 09/05/2022 16:15:38 ******/
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
