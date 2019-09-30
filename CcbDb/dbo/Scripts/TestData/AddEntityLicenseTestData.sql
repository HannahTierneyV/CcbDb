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