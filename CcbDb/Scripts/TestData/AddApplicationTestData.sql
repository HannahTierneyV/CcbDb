﻿IF NOT  EXISTS (SELECT * FROM [dbo].[Applications] WHERE [APPLICATION_ID] IN (1,2,3) )
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