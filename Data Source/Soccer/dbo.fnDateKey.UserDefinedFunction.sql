USE [EuropeanSoccer]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDateKey]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* * * * * * * * * * * * * * * * * * * * * * * * * *
|
|	CREATED BY DANNY GONZALEZ
|	MAY 7th, 2022
|	USER DEFINED FUNCTION
|	GET FACT MATCH DATASET FROM THE SQLITE DATABASE
|
* * * * * * * * * * * * * * * * * * * * * * * * * */

CREATE FUNCTION [dbo].[fnDateKey]
(
	@FullDate AS DATETIME2
)
RETURNS BIGINT
AS 
BEGIN 
	RETURN (YEAR(@FullDate) * 100 + MONTH(@FullDate)) * 100 + DAY(@FullDate)
END

GO
