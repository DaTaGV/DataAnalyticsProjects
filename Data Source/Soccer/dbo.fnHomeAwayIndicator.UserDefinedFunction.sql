USE [EuropeanSoccer]
GO
/****** Object:  UserDefinedFunction [dbo].[fnHomeAwayIndicator]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 7th, 2022
|	USER FUNCTION
|	SELECT A COLUMN NAME "HOME" OR "AWAY" _team_api_id
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE FUNCTION [dbo].[fnHomeAwayIndicator] 
(
	@HomeAway AS VARCHAR(4) 
)
RETURNS VARCHAR(16)
AS
BEGIN
	RETURN CAST(CAST(@HomeAway AS VARCHAR(4)) + '_team_api_id' AS VARCHAR(16))
END
GO
