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