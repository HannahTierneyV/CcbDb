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
			'87456'),
		   (4,
			1,
			'whaley Co.',
			'whaley Co.',
			'779 SW 15th',
			'Corvallis',
			'OR',
			'97333'),
		   (5,
			2,
			'Marika Co.',
			'Marika Co.',
			'1234 sw 5th',
			'Corvallis',
			'OR',
			'97333'),
		   (6,
			1,
			'Joe',
			'Bob',
			'why 15th',
			'why are we here',
			'IA',
			'9999'),
		   (7,
			1,
			'Hannah',
			'Vaughan',
			'2660 Ermine st SW',
			'Albany',
			'OR',
			'97322'),
		   (8,
			2,
			'Lucas',
			'Burns',
			'2504-2500 E Lynn St',
			'Seattle',
			'WA',
			'98112'),
		   (9,
			1,
			'Zeyad',
			'Shureih',
			'2401-2499 E Boston St',
			'Seattle',
			'WA',
			'98112'),
		   (10,
			2,
			'Carrie',
			'Hertel',
			'1831-1713 N Eagle View St',
			'Nampa',
			'ID',
			'83651');
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
	), (
        5,
		997846,
		'Whaley Co.',
		1,
		0,
		2201
	), (
	    6,
	    987456,
	    'Marika Co.',
	    2,
	    0,
	    9999
	), (
		7,
		654789,
	    'Joe',
		1,
		0,
		1000
	), (
		8,
		999999,
		'Hannah',
		1,
		1,
		0001
	), (
		9,
		963258,
		'Lucas',
		3,
		0,
		2229
	), (
		10,
		147852,
		'Zeyad',
		3,
		0,
		2225
	), (
		11,
		258963,
		'Carrie',
		1,
		1,
		7894
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
	), ( 
		4,
		997846
    ), (
		5,
		987456
	), (
		6,
		654789
	), (
		7,
		999999
	), (
		8,
		963258
	), (
		9,
		147852
	), (
		10,
		258963
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
		'2030-06-20T09:54:23'),
		(
		4,
		4,
		1,
		2,
		'997846',
		'2030-06-20T09:54:23'),
		( 
		5,
		5,
		1,
		2,
		'987456',
		'2030-06-20T09:54:23'),
		(
		6,
		6,
		1,
		1,
		'654789',
		'2030-06-20T09:54:23'),
		(
		7,
		7,
		1,
		2,
		'999999',
		'2030-06-20T09:54:23'),
		(
		8,
		8,
		1,
		1,
		'963258',
		'2030-06-20T09:54:23'),
		(
		9,
		9,
		1,
		1,
		'147852',
		'2030-06-20T09:54:23'),
		(
		10,
		10,
		1,
		2,
		'258963',
		'2030-06-20T09:54:23');
	SET IDENTITY_INSERT [Applications] OFF;
END
GO
