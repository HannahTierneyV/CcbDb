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