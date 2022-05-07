USE [master]
GO

/****** Object:  LinkedServer [SOCCER]    Script Date: 07/05/2022 17:14:14 ******/
EXEC master.dbo.sp_dropserver @server=N'SOCCER', @droplogins='droplogins'
GO

/****** Object:  LinkedServer [SOCCER]    Script Date: 07/05/2022 17:14:14 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'SOCCER', @srvproduct=N'SOCCER', @provider=N'MSDASQL', @datasrc=N'SOCCER'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'SOCCER',@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'SOCCER', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


