
CREATE   PROCEDURE [workers].[DumpDataAndWait178]
	(
	@SecondWait TINYINT = 0
	)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @Delay VARCHAR(8)
	SELECT
		@Delay = '00:00:0' + LEFT(ABS(CAST(CAST(NEWID() AS VARBINARY(192)) AS INT)),1)

	INSERT INTO [dbo].[DataDump] 
		(
		[SomeValue]
		)
	SELECT TOP 1
		[stopword]
	FROM 
		sys.fulltext_system_stopwords 
	WHERE 
		[language_id] = 1033
	ORDER BY
		NEWID()

	WAITFOR DELAY @Delay

END
