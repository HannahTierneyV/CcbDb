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