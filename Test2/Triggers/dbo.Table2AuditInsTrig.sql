CREATE TRIGGER [dbo].[Table2AuditInsTrig]
	ON [dbo].[Table2]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[Table2AuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
