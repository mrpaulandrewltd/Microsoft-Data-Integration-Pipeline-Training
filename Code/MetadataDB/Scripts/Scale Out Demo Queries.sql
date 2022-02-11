--do this before demo:
ALTER DATABASE [trainingdb01]
MODIFY
	(
	EDITION = 'Standard',
	SERVICE_OBJECTIVE = 'S6', --800 concurrent requests
	MAXSIZE = 50 GB
	);

SELECT * FROM sys.database_service_objectives


--for demo
SELECT * FROM [dbo].[Buckets];

SELECT * FROM [dbo].[BucketProcesses];

SELECT * FROM [dbo].[BucketToProcessMap];

EXEC [dbo].[SetBucketProcesses] @DebugMode = 1;

TRUNCATE TABLE [dbo].[DataDump];

SELECT COUNT(0) FROM [dbo].[DataDump];
SELECT [SomeValue] FROM [dbo].[DataDump];


--after demo
ALTER DATABASE [trainingdb01]
MODIFY
	(
	EDITION = 'Standard',
	SERVICE_OBJECTIVE = 'S2',
	MAXSIZE = 50 GB
	)