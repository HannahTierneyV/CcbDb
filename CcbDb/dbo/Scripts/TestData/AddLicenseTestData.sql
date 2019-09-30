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