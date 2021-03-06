USE [EuropeanSoccer]
GO
/****** Object:  Table [dbo].[FactMatchPlayers]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactMatchPlayers](
	[Country_Id] [int] NOT NULL,
	[League_Id] [int] NOT NULL,
	[Team_Id] [int] NOT NULL,
	[Player_Id] [int] NOT NULL,
	[Home_Away_Indicator] [nvarchar](4) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Match_api_id] [int] NOT NULL,
 CONSTRAINT [PK_FactMatchPlayers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactMatchPlayers]  WITH NOCHECK ADD  CONSTRAINT [FK_FactMatchPlayers_DimCountry] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[DimCountry] ([Country_Id])
GO
ALTER TABLE [dbo].[FactMatchPlayers] CHECK CONSTRAINT [FK_FactMatchPlayers_DimCountry]
GO
ALTER TABLE [dbo].[FactMatchPlayers]  WITH NOCHECK ADD  CONSTRAINT [FK_FactMatchPlayers_DimLeague] FOREIGN KEY([League_Id])
REFERENCES [dbo].[DimLeague] ([League_Id])
GO
ALTER TABLE [dbo].[FactMatchPlayers] CHECK CONSTRAINT [FK_FactMatchPlayers_DimLeague]
GO
ALTER TABLE [dbo].[FactMatchPlayers]  WITH NOCHECK ADD  CONSTRAINT [FK_FactMatchPlayers_DimPlayer] FOREIGN KEY([Player_Id])
REFERENCES [dbo].[DimPlayer] ([Player_Id])
GO
ALTER TABLE [dbo].[FactMatchPlayers] CHECK CONSTRAINT [FK_FactMatchPlayers_DimPlayer]
GO
ALTER TABLE [dbo].[FactMatchPlayers]  WITH NOCHECK ADD  CONSTRAINT [FK_FactMatchPlayers_DimTeam] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[DimTeam] ([Team_Id])
GO
ALTER TABLE [dbo].[FactMatchPlayers] CHECK CONSTRAINT [FK_FactMatchPlayers_DimTeam]
GO
