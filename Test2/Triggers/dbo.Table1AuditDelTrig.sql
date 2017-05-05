CREATE TRIGGER [dbo].[Table1AuditDelTrig]
	ON [dbo].[Table1]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[Table1AuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
