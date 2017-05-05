CREATE TRIGGER [dbo].[Table2AuditUpdTrig]
	ON [dbo].[Table2]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[Table2AuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
