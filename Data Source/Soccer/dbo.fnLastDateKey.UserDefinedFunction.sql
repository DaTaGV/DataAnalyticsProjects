USE [EuropeanSoccer]
GO
/****** Object:  UserDefinedFunction [dbo].[fnLastDateKey]    Script Date: 09/05/2022 9:47:02 ******/
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
