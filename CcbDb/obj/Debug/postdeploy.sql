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
		1111
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
	), (
		1,
		987654
	);
	SET IDENTITY_INSERT [EntityLicenses] OFF;
END
IF NOT  EXISTS (SELECT * FROM [Applications] WHERE ApplicationId IN (1,2,3) )
BEGIN
	SET IDENTITY_INSERT [Applications] ON;
	Insert into [Applications] (
	[ApplicationId],
	[UserId],
	[ApplicationState],
	[ApplicationType],
	[CcbNumber],
	[ExpirationDate])
	VALUES (
		1,
		1,
		1,
		1,
		'123456',
		'2030-06-20T09:54:23'),
		(
		2,
		2,
		2,
		2,
		'654321',
		'2030-06-20T09:54:23'),
		(
		3,
		3,
		1,
		1,
		'123654',
		'2030-06-20T09:54:23');
	SET IDENTITY_INSERT [Applications] OFF;
END
GO
