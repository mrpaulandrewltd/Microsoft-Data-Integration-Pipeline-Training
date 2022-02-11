CREATE TABLE [dbo].[Buckets] (
    [BucketId]   INT           IDENTITY (1, 1) NOT NULL,
    [BucketCode] VARCHAR (50)  NOT NULL,
    [Details]    VARCHAR (500) NULL,
    [Enabled]    BIT           CONSTRAINT [DF_Buckets_Enabled] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Buckets] PRIMARY KEY CLUSTERED ([BucketId] ASC)
);

