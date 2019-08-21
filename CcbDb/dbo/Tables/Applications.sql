CREATE TABLE [dbo].[Applications]
(
	[ApplicationId] INT	IDENTITY (1, 1) NOT NULL,
	[UserId] INT NOT NULL,
	[ApplicationState] INT NOT NULL,
	[ApplicationType] INT NOT NULL,
	[CcbNumber] VARCHAR(9) NOT NULL,
	[ExpirationDate] DATETIME NOT NULL,
	CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED ([ApplicationId])
)
