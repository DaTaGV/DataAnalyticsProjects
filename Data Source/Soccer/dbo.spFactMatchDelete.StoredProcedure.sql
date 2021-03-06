USE [EuropeanSoccer]
GO
/****** Object:  StoredProcedure [dbo].[spFactMatchDelete]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 8th, 2022
|	STORED PROCEDURE
|	DELETE FACT MATCH DATA ROWS
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE PROCEDURE [dbo].[spFactMatchDelete](@HomeAway AS VARCHAR(4), @YearMonth AS VARCHAR(6))
AS

	SET NOCOUNT ON;

	DELETE FROM FactMatchPlayers 
	WHERE 
		Match_api_id IN( SELECT DISTINCT Match_api_id FROM FactMatch WHERE DateKey BETWEEN @YearMonth*100+1 AND @YearMonth*100+31 
							AND Home_Away_Indicator = @HomeAway
						)
		AND Home_Away_Indicator = @HomeAway; 

	DELETE FROM FactMatch 
	WHERE 
		DateKey BETWEEN @YearMonth*100+1 AND @YearMonth*100+31 
		AND Home_Away_Indicator = @HomeAway; 
	
	SELECT 1 AS RESULT


	
GO
