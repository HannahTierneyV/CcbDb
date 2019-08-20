CREATE TABLE [dbo].[EntityLicenses]
(
	[UserId]				INT		IDENTITY (1, 1) NOT NULL,
	[CcbLicenseNumber]		INT		NOT NULL,
	CONSTRAINT [PK_EntityLicenses] PRIMARY KEY CLUSTERED ([UserId], [CcbLicenseNumber]),
	CONSTRAINT [FK_EntityLicenses_Entities] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Entities] ([Id])
)
