USE [EuropeanSoccer]
GO
/****** Object:  Table [dbo].[FactMatch]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactMatch](
	[Country_Id] [int] NOT NULL,
	[League_Id] [int] NOT NULL,
	[Season] [nvarchar](10) NOT NULL,
	[Stage] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Team_Id] [int] NOT NULL,
	[Home_Away_Indicator] [nvarchar](4) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Goal] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[Match_api_id] [int] NOT NULL,
	[GlobalResult] [varchar](4) NOT NULL,
 CONSTRAINT [PK_FactMatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactMatch]  WITH NOCHECK ADD  CONSTRAINT [FK_FactMatch_DimCountry] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[DimCountry] ([Country_Id])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimCountry]
GO
ALTER TABLE [dbo].[FactMatch]  WITH NOCHECK ADD  CONSTRAINT [FK_FactMatch_DimLeague] FOREIGN KEY([League_Id])
REFERENCES [dbo].[DimLeague] ([League_Id])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimLeague]
GO
ALTER TABLE [dbo].[FactMatch]  WITH NOCHECK ADD  CONSTRAINT [FK_FactMatch_DimTeam] FOREIGN KEY([Team_Id])
REFERENCES [dbo].[DimTeam] ([Team_Id])
GO
ALTER TABLE [dbo].[FactMatch] CHECK CONSTRAINT [FK_FactMatch_DimTeam]
GO
