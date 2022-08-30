CREATE TABLE [dbo].[DataDump](
	[SomeValue] [nvarchar](50) NOT NULL,
	[DateTimeAdded] [datetime] NOT NULL DEFAULT (getdate())
);

