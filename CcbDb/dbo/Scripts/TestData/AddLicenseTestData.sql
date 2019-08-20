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