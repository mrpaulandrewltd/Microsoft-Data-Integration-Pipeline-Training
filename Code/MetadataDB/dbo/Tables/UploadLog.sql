CREATE TABLE [dbo].[UploadLog]
	(
	[LogId] [INT] IDENTITY(1,1) NOT NULL,
	[UploadStartDateTime] [DATETIME] NOT NULL,
	[UploadEndDateTime] [DATETIME] NULL,
	[FileUploadCount] [INT] NULL,
	[TriggerId] [VARCHAR](36) NULL,
	CONSTRAINT [PK_UploadLog] PRIMARY KEY CLUSTERED ([LogId] ASC)
	)