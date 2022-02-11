DECLARE @SQL VARCHAR(MAX) = ''

SELECT 	
	@SQL += 'DROP TABLE ' + QUOTENAME(s.name) + '.' + QUOTENAME(o.name) + ';' + CHAR(13)
FROM  	
	sys.objects o 	
	INNER JOIN sys.schemas s 		
		ON o.schema_id = s.schema_id 
WHERE  	
	o.[type] = 'U'

PRINT @SQL
EXEC(@SQL)