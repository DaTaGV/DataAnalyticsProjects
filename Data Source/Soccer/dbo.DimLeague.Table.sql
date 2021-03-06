USE [EuropeanSoccer]
GO
/****** Object:  Table [dbo].[DimLeague]    Script Date: 09/05/2022 16:15:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLeague](
	[League_Id] [int] NOT NULL,
	[Country_Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DimLeague] PRIMARY KEY CLUSTERED 
(
	[League_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimLeague]  WITH NOCHECK ADD  CONSTRAINT [FK_DimLeague_DimCountry] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[DimCountry] ([Country_Id])
GO
ALTER TABLE [dbo].[DimLeague] CHECK CONSTRAINT [FK_DimLeague_DimCountry]
GO
