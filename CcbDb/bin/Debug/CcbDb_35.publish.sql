﻿/*
Deployment script for CcbDb

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "CcbDb"
:setvar DefaultFilePrefix "CcbDb"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[CcbLicenses]...';


GO
CREATE TABLE [dbo].[CcbLicenses] (
    [ApplicationId]         INT           IDENTITY (1, 1) NOT NULL,
    [CcbNumber]             INT           NOT NULL,
    [BusinessName]          VARCHAR (MAX) NOT NULL,
    [LicenseType]           INT           NOT NULL,
    [LicenseStatus]         INT           NOT NULL,
    [LicenseExpirationDate] DATETIME      NULL,
    [Ssn]                   INT           NOT NULL,
    CONSTRAINT [PK_CcbLicenses] PRIMARY KEY CLUSTERED ([ApplicationId] ASC),
    CONSTRAINT [UC_CcbNumber] UNIQUE NONCLUSTERED ([CcbNumber] ASC)
);


GO
PRINT N'Creating [dbo].[Entities]...';


GO
CREATE TABLE [dbo].[Entities] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [NameType]   INT           NOT NULL,
    [FirstName]  VARCHAR (MAX) NOT NULL,
    [MiddleName] VARCHAR (MAX) NULL,
    [LastName]   VARCHAR (MAX) NOT NULL,
    [Address]    VARCHAR (MAX) NOT NULL,
    [City]       VARCHAR (MAX) NOT NULL,
    [State]      VARCHAR (MAX) NOT NULL,
    [ZipCode]    VARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Entities] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EntityLicenses]...';


GO
CREATE TABLE [dbo].[EntityLicenses] (
    [UserId]           INT IDENTITY (1, 1) NOT NULL,
    [CcbLicenseNumber] INT NOT NULL,
    CONSTRAINT [PK_EntityLicenses] PRIMARY KEY CLUSTERED ([UserId] ASC, [CcbLicenseNumber] ASC)
);


GO
PRINT N'Creating [dbo].[FK_EntityLicenses_Entities]...';


GO
ALTER TABLE [dbo].[EntityLicenses]
    ADD CONSTRAINT [FK_EntityLicenses_Entities] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Entities] ([Id]);


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
-- Name Type Key --
--	1	User
--	2	Entity

IF NOT EXISTS (SELECT * FROM [Entities] WHERE [Id] IN (1, 2, 3))
BEGIN
	SET IDENTITY_INSERT [Entities] ON;
	INSERT INTO [Entities] (
		[Id],
		[NameType],
		[FirstName],
		[LastName],
		[Address],
		[City],
		[State],
		[ZipCode])
	VALUES (1,
			1,
			'Bob',
			'The Builder',
			'900 Construction St',
			'Constructionville',
			'OR',
			'97400'),
		   (2,
		    2,
			'Bob & Co.',
			'Bob & Co.',
			'124 Bob Lives Somewhere St',
			'NotConstructionville',
			'IA',
			'54312'),
		   (3,
		    1,
			'The Builder',
			'That Is Not Bob',
			'900 Not Bob St Anymore',
			'Constructionburg',
			'WY',
			'87456');
	SET IDENTITY_INSERT [Entities] OFF;
END
-- License Type Key --
--	1	Generic CCB License
--	2	HEA
--	3	HEPSC

-- License Status Key --
--	0	Incomplete
--	1	Complete

IF NOT EXISTS (SELECT * FROM [CcbLicenses] WHERE [ApplicationId] IN (1, 2, 3, 4)) AND
   NOT EXISTS (SELECT * FROM [CcbLicenses] WHERE [CcbNumber] IN (123456, 654321, 321654, 987654))
BEGIN
	SET IDENTITY_INSERT [CcbLicenses] ON;
	INSERT INTO [CcbLicenses] (
		[ApplicationId],
		[CcbNumber],
		[BusinessName],
		[LicenseType],
		[LicenseStatus],
		[Ssn])
	VALUES (
		1,
		123456,
		'Bob & Co.',
		1,
		1,
		1111
	), (
		2,
		654321,
		'Constructioneers',
		2,
		0,
		2222
	), (
		3,
		321654,
		'No Lead 2Day',
		3,
		1,
		3333
	), (
		4,
		987654,
		'Bob Inc.',
		1,
		1,
		4444
	);
	SET IDENTITY_INSERT [CcbLicenses] OFF;
END
IF NOT EXISTS (SELECT * FROM [EntityLicenses] WHERE [UserId] IN (1, 2, 3))
BEGIN
	SET IDENTITY_INSERT [EntityLicenses] ON;
	INSERT INTO [EntityLicenses] (
		[UserId],
		[CcbLicenseNumber])
	VALUES (
		1,
		123456
	), (
		2,
		654321
	), (
		3,
		321654
	);
	SET IDENTITY_INSERT [EntityLicenses] OFF;
END
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
