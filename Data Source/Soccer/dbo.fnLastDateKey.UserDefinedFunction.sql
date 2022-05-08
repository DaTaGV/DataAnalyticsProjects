USE [EuropeanSoccer]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLastDateKey]    Script Date: 08/05/2022 15:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnLastDateKey]
(
)
RETURNS  VARCHAR(8)
AS	
BEGIN
	RETURN	(SELECT MINPERIOD as StartPeriod FROM  OPENQUERY(SOCCER, 'SELECT MAX(strftime(''%Y%m%d'', date)) AS MINPERIOD 	FROM MATCH '))
END
GO
