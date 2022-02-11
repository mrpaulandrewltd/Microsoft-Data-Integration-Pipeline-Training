CREATE PROCEDURE [LogUploadFinish]
	(
	@LogId INT
	)
AS
BEGIN

	UPDATE
		[dbo].[UploadLog]
	SET
		[UploadEndDateTime] = GETDATE()
	WHERE
		[LogId] = @LogId;

END;