CREATE TRIGGER [dbo].[sysdiagramsAuditInsTrig]
	ON [dbo].[sysdiagrams]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[sysdiagramsAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
