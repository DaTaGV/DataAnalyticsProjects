USE [EuropeanSoccer]
GO
/****** Object:  StoredProcedure [dbo].[spMinPeriod]    Script Date: 08/05/2022 15:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 7th, 2022
|	USER DEFINED FUNCTION
|	GET MIN DATE FACT MATCH DATASET FROM THE SQLITE DATABASE
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE PROCEDURE [dbo].[spMinPeriod]
AS 

	SELECT 
		MINPERIOD as StartPeriod
	FROM 
	OPENQUERY(SOCCER, 'SELECT MIN(strftime(''%Y%m'', date)) AS MINPERIOD 	FROM MATCH ' )
GO
