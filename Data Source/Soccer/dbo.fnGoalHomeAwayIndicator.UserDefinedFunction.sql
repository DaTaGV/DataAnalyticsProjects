USE [EuropeanSoccer]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGoalHomeAwayIndicator]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 7th, 2022
|	USER FUNCTION
|	SELECT A COLUMN NAME "HOME" OR "AWAY" _team_goal
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE FUNCTION [dbo].[fnGoalHomeAwayIndicator] 
(
	@HomeAway AS VARCHAR(4) 
)
RETURNS VARCHAR(14)
AS
BEGIN
	RETURN CAST(CAST(@HomeAway AS VARCHAR(4)) + '_team_goal' AS VARCHAR(14))
END
GO
