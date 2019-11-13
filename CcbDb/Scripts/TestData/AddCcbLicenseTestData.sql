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