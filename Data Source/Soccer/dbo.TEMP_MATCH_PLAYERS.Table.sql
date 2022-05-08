USE [EuropeanSoccer]
GO
/****** Object:  Table [dbo].[TEMP_MATCH_PLAYERS]    Script Date: 08/05/2022 15:57:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEMP_MATCH_PLAYERS](
	[Country_Id] [int] NULL,
	[League_Id] [int] NULL,
	[Team_Id] [int] NULL,
	[Player_Id] [int] NULL,
	[Home_Away_Indicator] [nvarchar](4) NULL,
	[Match_api_id] [int] NULL
) ON [PRIMARY]
GO
