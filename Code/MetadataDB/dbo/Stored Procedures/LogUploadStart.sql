CREATE PROCEDURE [LogUploadStart]
	(
	@FileCount INT,
	@TriggerId VARCHAR(36)
	)
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO [dbo].[UploadLog]
		(
		[UploadStartDateTime],
		[FileUploadCount],
		[TriggerId]
		)
	VALUES
		(
		GETDATE(),
		@FileCount,
		@TriggerId
		)

	SELECT
		SCOPE_IDENTITY() AS LogId

END;