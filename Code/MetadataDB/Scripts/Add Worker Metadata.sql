DECLARE @NumberOfProcesses INT = 500

DELETE FROM [dbo].[BucketToProcessMap]
DELETE FROM [dbo].[BucketProcesses]

DECLARE @Duration VARCHAR(10)
DECLARE @NumberOfProcessesLocal INT
DECLARE @RandomNumber INT
DECLARE @TempProcesses TABLE
	(
	[ProcessName] VARCHAR(50),
	[ObjectName] NVARCHAR(128),
	[ObjectParameters] NVARCHAR(500),
	[Duration] INT
	)
	
SET @NumberOfProcessesLocal = @NumberOfProcesses

WHILE @NumberOfProcessesLocal > 0
BEGIN

	SELECT 
		@RandomNumber = ROUND(((10 - 1 -1) * RAND() + 1), 0)
	
	INSERT INTO @TempProcesses
	SELECT 
		'SomeStoredProc',	
		'DumpDataAndWait',	
		'@SecondWait = ' + CAST(@RandomNumber AS VARCHAR),
		@RandomNumber
	
	SET @NumberOfProcessesLocal = @NumberOfProcessesLocal - 1
	SET @RandomNumber = NULL
END

INSERT INTO [dbo].[BucketProcesses]
	(
	[ProcessName],
	[ObjectName],
	[ObjectParameters],
	[Duration]
	)
SELECT * FROM @TempProcesses

SELECT 
	@Duration = CAST(SUM(CAST([Duration] AS FLOAT))/60 AS VARCHAR)
FROM 
	[dbo].[BucketProcesses]

PRINT CAST(@NumberOfProcesses AS VARCHAR) + ' proccesses generated.'
PRINT ''
PRINT 'Duration total if executed in squence: ' + @Duration + ' minutes.'