SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SpatialTable] (
		[id]               [int] NOT NULL,
		[geometry_col]     [geometry] NULL,
		CONSTRAINT [PK__SpatialT__3213E83F24D4C651]
		PRIMARY KEY
		CLUSTERED
		([id])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE SPATIAL INDEX [SIndx_SpatialTable_geometry_col1]
	ON [dbo].[SpatialTable] ([geometry_col])
	USING GEOMETRY_AUTO_GRID
	WITH ( BOUNDING_BOX = (0, 0, 500, 200),
	 CELLS_PER_OBJECT = 8 )
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[SpatialTable] SET (LOCK_ESCALATION = TABLE)
GO
