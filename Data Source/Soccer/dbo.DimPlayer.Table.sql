USE [EuropeanSoccer]
GO
/****** Object:  Table [dbo].[DimPlayer]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPlayer](
	[Player_Id] [int] NOT NULL,
	[Name] [varchar](60) NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[Height] [float] NOT NULL,
	[Weight] [float] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
 CONSTRAINT [PK_DimPlayer] PRIMARY KEY CLUSTERED 
(
	[Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
