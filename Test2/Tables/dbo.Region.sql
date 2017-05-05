SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Region] (
		[RegionID]              [int] NOT NULL,
		[RegionDescription]     [nchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		CONSTRAINT [PK_Region]
		PRIMARY KEY
		NONCLUSTERED
		([RegionID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Region] SET (LOCK_ESCALATION = TABLE)
GO
