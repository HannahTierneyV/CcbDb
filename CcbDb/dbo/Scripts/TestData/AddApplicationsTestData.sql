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