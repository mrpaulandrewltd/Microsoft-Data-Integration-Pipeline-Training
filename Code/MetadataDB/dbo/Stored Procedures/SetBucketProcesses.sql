
CREATE   PROCEDURE [dbo].[SetBucketProcesses]
	(
	@DebugMode BIT = 0
	)
AS

BEGIN
	
	DELETE FROM [dbo].[BucketToProcessMap] 

	;WITH maxBuckets AS
		(
		SELECT MAX([BucketId]) AS 'MaxBucket' FROM [dbo].[Buckets]
		)

	INSERT INTO [dbo].[BucketToProcessMap] 
	SELECT
		CASE
			WHEN (ROW_NUMBER() OVER (ORDER BY p.[Duration] DESC) * 1) % maxBuckets.[MaxBucket] = 0 THEN maxBuckets.[MaxBucket]
			ELSE (ROW_NUMBER() OVER (ORDER BY p.[Duration] DESC) * 1) % maxBuckets.[MaxBucket]
		END AS 'NewBucketId',
		p.[ProcessId]
	FROM 
		[dbo].[BucketProcesses] p
		CROSS JOIN maxBuckets

	IF @DebugMode = 1
	BEGIN
		;WITH maxBuckets AS
			(
			SELECT MAX([BucketId]) AS 'MaxBucket' FROM [dbo].[Buckets]
			)
		SELECT
			CASE
				WHEN (ROW_NUMBER() OVER (ORDER BY p.[Duration] DESC) * 1) % maxBuckets.[MaxBucket] = 0 THEN maxBuckets.[MaxBucket]
				ELSE (ROW_NUMBER() OVER (ORDER BY p.[Duration] DESC) * 1) % maxBuckets.[MaxBucket]
			END AS 'NewBucketId',
			p.*
		FROM 
			[dbo].[BucketProcesses] p
			CROSS JOIN maxBuckets
	END
END
