-- Name Type Key --
--	1	User
--	2	Entity

IF NOT EXISTS (SELECT * FROM [dbo].[Entities] WHERE [ID] IN (1, 2, 3))
BEGIN
	SET IDENTITY_INSERT [dbo].[Entities] ON;
	INSERT INTO [dbo].[Entities] (
		[ID],
		[FIRST_NAME],
		[LAST_NAME],
		[ADDRESS],
		[CITY],
		[STATE],
		[ZIP_CODE])
	VALUES (
		1,
		'Bob',
		'The Builder',
		'900 Construction St',
		'Constructionville',
		'OR',
		'97400'),
		(
		2,
		'Bob & Co.',
		'Bob & Co.',
		'124 Bob Lives Somewhere St',
		'NotConstructionville',
		'IA',
		'54312'),
		(
		3,
		'The Builder',
		'That Is Not Bob',
		'900 Not Bob St Anymore',
		'Constructionburg',
		'WY',
		'87456'),
		(
		4,
		'whaley Co.',
		'whaley Co.',
		'779 SW 15th',
		'Corvallis',
		'OR',
		'97333'),
		(
		5,
		'Marika Co.',
		'Marika Co.',
		'1234 sw 5th',
		'Corvallis',
		'OR',
		'97333'),
		(
		6,
		'Joe',
		'Bob',
		'why 15th',
		'why are we here',
		'IA',
		'9999'),
		(
		7,
		'Hannah',
		'Vaughan',
		'2660 Ermine st SW',
		'Albany',
		'OR',
		'97322'),
		(
		8,
		'Lucas',
		'Burns',
		'2504-2500 E Lynn St',
		'Seattle',
		'WA',
		'98112'),
		(
		9,
		'Zeyad',
		'Shureih',
		'2401-2499 E Boston St',
		'Seattle',
		'WA',
		'98112'),
		(
		10,
		'Carrie',
		'Hertel',
		'1831-1713 N Eagle View St',
		'Nampa',
		'ID',
		'83651');
	SET IDENTITY_INSERT [dbo].[Entities] OFF;
END
-- License Type Key --
--	1	Generic CCB License
--	2	HEA
--	3	HEPSC

-- License Status Key --
--	0	Incomplete
--	1	Complete

IF NOT EXISTS (SELECT * FROM [dbo].[CcbLicenses] WHERE [APPLICATION_ID] IN (1, 2, 3, 4)) AND
   NOT EXISTS (SELECT * FROM [dbo].[CcbLicenses] WHERE [REGISTRATION_NUMBER] IN (123456, 654321, 321654, 987654))
BEGIN
	SET IDENTITY_INSERT [dbo].[CcbLicenses] ON;
	INSERT INTO [dbo].[CcbLicenses] (
		[APPLICATION_ID],
		[NAME],
		[REGISTRATION_NUMBER],
		[SSN])
	VALUES (
		1,
		'Bob & Co.',
		123456,
		'1111'),
	    (
		2,
		'Constructioneers',
		654321,
		'2222'),
		(
		3,
		'No Lead 2Day',
		321654,
		'3333'),
		(
		4,
		'Bob Inc.',
		987654,
		'1111'),
		(
        5,
		'Whaley Co.',
		997846,
		'2201'),
		(
	    6,
	    'Marika Co.',
	    987456,
	    '9999'),
		(
		7,
	    'Joe',
		654789,
		'1000'),
		(
		8,
		'Hannah',
		999999,
		'0001'),
		(
		9,
		'Lucas',
		963258,
		'2229'),
		(
		10,
		'Zeyad',
		147852,
		'2225'),
		(
		11,
		'Carrie',
		258963,
		'7894');
	SET IDENTITY_INSERT [CcbLicenses] OFF;
END
IF NOT EXISTS (SELECT * FROM [dbo].[EntityLicenses] WHERE [USER_ID] IN (1, 2, 3))
BEGIN
	SET IDENTITY_INSERT [dbo].[EntityLicenses] ON;
	INSERT INTO [dbo].[EntityLicenses] (
		[USER_ID],
		[REGISTRATION_NUMBER])
	VALUES (
		1,
		123456),
		(
		2,
		654321),
		(
		3,
		321654),
		(
		1,
		987654),
		( 
		4,
		997846),
		(
		5,
		987456),
		(
		6,
		654789),
		(
		7,
		999999),
		(
		8,
		963258),
		(
		9,
		147852),
		(
		10,
		258963);
	SET IDENTITY_INSERT [dbo].[EntityLicenses] OFF;
END
IF NOT  EXISTS (SELECT * FROM [dbo].[Applications] WHERE [APPLICATION_ID] IN (1,2,3) )
BEGIN
	SET IDENTITY_INSERT [dbo].[Applications] ON;
	INSERT INTO [dbo].[Applications] (
		[APPLICATION_ID],
		[USER_ID],
		[APPLICATION_STATE],
		[APPLICATION_TYPE],
		[REGISTRATION_NUMBER],
		[EXPIRATION_DATE])
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
	SET IDENTITY_INSERT [dbo].[Applications] OFF;
END
GO
