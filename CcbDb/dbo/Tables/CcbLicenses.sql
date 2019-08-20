CREATE TABLE [dbo].[CcbLicenses]
(
	[ApplicationId]				INT				IDENTITY (1, 1) NOT NULL,
	[CcbNumber]					INT				NOT NULL,
	[BusinessName]				VARCHAR(MAX)	NOT NULL,
	[LicenseType]				INT				NOT NULL,
	[LicenseStatus]				INT				NOT NULL,
	[LicenseExpirationDate]		DATETIME		NULL,
	[Ssn]						INT				NOT NULL,
	CONSTRAINT [PK_CcbLicenses] PRIMARY KEY CLUSTERED ([ApplicationId]),
	CONSTRAINT [UC_CcbNumber] UNIQUE ([CcbNumber])
);
GO