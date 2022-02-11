CREATE   PROCEDURE [dbo].[SetBucketLogEntry]
	(
	@LogId INT = NULL
	)
AS

BEGIN

	IF @LogId IS NULL
	BEGIN

		TRUNCATE TABLE [dbo].[DataDump]
		TRUNCATE TABLE [dbo].[BucketLog]

		INSERT INTO [dbo].[BucketLog] ([LogStartDate], [LogDetail]) VALUES (GETDATE(), 'Running Scale Demo')

		SELECT SCOPE_IDENTITY() AS 'LogId'

	END
	ELSE
	BEGIN
		UPDATE
			[dbo].[BucketLog]
		SET
			[LogEndDate] = GETDATE()
		WHERE
			[LogId] = @LogId
	END
END
