CREATE TRIGGER [dbo].[Table1AuditInsTrig]
	ON [dbo].[Table1]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[Table1AuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
