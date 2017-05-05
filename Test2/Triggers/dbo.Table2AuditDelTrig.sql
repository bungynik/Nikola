CREATE TRIGGER [dbo].[Table2AuditDelTrig]
	ON [dbo].[Table2]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[Table2AuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
