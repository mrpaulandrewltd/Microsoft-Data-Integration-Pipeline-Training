CREATE PROCEDURE [dbo].[GetBuckets]
AS

BEGIN
	SELECT [BucketId] FROM [dbo].[Buckets] WHERE [Enabled] = 1
END
