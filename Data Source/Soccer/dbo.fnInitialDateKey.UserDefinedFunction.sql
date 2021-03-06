USE [EuropeanSoccer]
GO
/****** Object:  UserDefinedFunction [dbo].[fnInitialDateKey]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	

CREATE FUNCTION [dbo].[fnInitialDateKey]
(
)
RETURNS VARCHAR(8)
AS	
BEGIN
	RETURN	CAST((SELECT MINPERIOD as StartPeriod FROM  OPENQUERY(SOCCER, 'SELECT MIN(strftime(''%Y%m%d'', date)) AS MINPERIOD FROM MATCH ')) AS VARCHAR)
END
GO
