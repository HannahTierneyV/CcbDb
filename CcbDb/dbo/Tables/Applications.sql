﻿CREATE TABLE [dbo].[Applications]
(
	[APPLICATION_ID]		INT			IDENTITY (1, 1) NOT NULL,
	[USER_ID]				INT			NOT NULL,
	[APPLICATION_STATE]		INT			NOT NULL,
	[APPLICATION_TYPE]		INT			NOT NULL,
	[REGISTRATION_NUMBER]	VARCHAR(9)	NOT NULL,
	[EXPIRATION_DATE]		DATETIME	NOT NULL,
	CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED ([APPLICATION_ID])
)
