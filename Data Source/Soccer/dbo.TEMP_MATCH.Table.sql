USE [EuropeanSoccer]
GO
/****** Object:  Table [dbo].[TEMP_MATCH]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEMP_MATCH](
	[country_id] [int] NULL,
	[league_id] [int] NULL,
	[season] [varchar](10) NULL,
	[stage] [int] NULL,
	[date] [datetime2](7) NULL,
	[Team_Id] [int] NULL,
	[Home_Away_Indicator] [varchar](4) NULL,
	[Goals] [int] NULL,
	[DateKey] [int] NULL,
	[Match_api_id] [int] NULL,
	[GlobalResult] [varchar](4) NULL
) ON [PRIMARY]
GO
