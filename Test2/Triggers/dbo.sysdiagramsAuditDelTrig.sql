CREATE TRIGGER [dbo].[sysdiagramsAuditDelTrig]
	ON [dbo].[sysdiagrams]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[sysdiagramsAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
