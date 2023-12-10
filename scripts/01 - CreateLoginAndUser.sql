USE [master]
GO
--
-- Primero hay que creal la base de datos 'DAI-Diciembre'
--

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE [name] = N'DAI-Diciembre')
BEGIN
	PRINT 'Creando Login'
	CREATE LOGIN [DAI-Diciembre] WITH 
		PASSWORD=N'DAI-Diciembre', 
		DEFAULT_DATABASE=[DAI-Diciembre], 
		CHECK_EXPIRATION=OFF, 
		CHECK_POLICY=OFF
END
GO

USE [DAI-Diciembre]
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE [name] = N'DAI-Diciembre')
BEGIN
	PRINT 'Creando User'
	CREATE USER [DAI-Diciembre] FOR LOGIN [DAI-Diciembre]
	ALTER ROLE [db_owner] ADD MEMBER [DAI-Diciembre]
END 
GO
