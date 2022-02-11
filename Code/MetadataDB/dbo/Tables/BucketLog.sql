CREATE TABLE [dbo].[BucketLog] (
    [LogId]        INT          IDENTITY (1, 1) NOT NULL,
    [LogStartDate] DATETIME     NOT NULL,
    [LogEndDate]   DATETIME     NULL,
    [LogDetail]    VARCHAR (50) NULL,
    CONSTRAINT [PK_BucketLog] PRIMARY KEY CLUSTERED ([LogId] ASC)
);

