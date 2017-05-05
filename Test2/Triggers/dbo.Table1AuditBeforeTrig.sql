SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.Table1AuditBeforeTrig
ON dbo.Table1
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @Tab VARBINARY(512)
	SET @Tab = CAST('Table1|dbo|' AS VARBINARY(512))
	SET CONTEXT_INFO @Tab
END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[Table1AuditBeforeTrig]', @order='First', @stmttype='INSERT'
GO
EXEC sp_settriggerorder @triggername= '[dbo].[Table1AuditBeforeTrig]', @order='First', @stmttype='DELETE'
GO
EXEC sp_settriggerorder @triggername= '[dbo].[Table1AuditBeforeTrig]', @order='First', @stmttype='UPDATE'
GO
