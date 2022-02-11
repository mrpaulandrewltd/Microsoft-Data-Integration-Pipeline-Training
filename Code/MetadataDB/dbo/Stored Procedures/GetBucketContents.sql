CREATE PROCEDURE [dbo].[GetBucketContents]
	(
	@BucketId INT
	)
AS

BEGIN
	SELECT 
		p.*
	FROM 
		[dbo].[BucketToProcessMap] m
		INNER JOIN [dbo].[BucketProcesses] p
			ON m.[ProcessId] = p.[ProcessId]
	WHERE
		m.[BucketId] = @BucketId
END
