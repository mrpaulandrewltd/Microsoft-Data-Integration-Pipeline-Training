CREATE TABLE [dbo].[BucketProcesses] (
    [ProcessId]        INT            IDENTITY (1, 1) NOT NULL,
    [ProcessName]      VARCHAR (50)   NOT NULL,
    [ProcessDetails]   VARCHAR (500)  NULL,
    [ObjectName]       NVARCHAR (128) NOT NULL,
    [ObjectParameters] NVARCHAR (500) NULL,
    [Duration]         INT            CONSTRAINT [DF_BProcesses_Duration] DEFAULT ((0)) NOT NULL,
    [LastUpdated]      DATETIME       CONSTRAINT [DF_BProcesses_LastUpdated] DEFAULT (getdate()) NOT NULL,
    [Enabled]          BIT            CONSTRAINT [DF_BProcesses_Enabled] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_BProcesses] PRIMARY KEY CLUSTERED ([ProcessId] ASC)
);

