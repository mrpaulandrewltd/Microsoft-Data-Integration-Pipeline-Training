CREATE TABLE [dbo].[FilesToUpload]
	(
	[SourceDirectory] [NVARCHAR](MAX) NOT NULL,
	[TargetDirectory] [NVARCHAR](MAX) NULL,
	[FileName] [NVARCHAR](255) NOT NULL,
	[Enabled] BIT NOT NULL
	)