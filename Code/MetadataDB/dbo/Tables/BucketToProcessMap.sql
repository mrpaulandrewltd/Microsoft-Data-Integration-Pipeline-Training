CREATE TABLE [dbo].[BucketToProcessMap] (
    [BucketId]  INT NOT NULL,
    [ProcessId] INT NOT NULL,
    CONSTRAINT [PK_BucketToProcessMap] PRIMARY KEY CLUSTERED ([BucketId] ASC, [ProcessId] ASC),
    CONSTRAINT [FK_BucketToProcessMap_BucketProcesses] FOREIGN KEY ([ProcessId]) REFERENCES [dbo].[BucketProcesses] ([ProcessId]),
    CONSTRAINT [FK_BucketToProcessMap_Buckets] FOREIGN KEY ([BucketId]) REFERENCES [dbo].[Buckets] ([BucketId])
);

