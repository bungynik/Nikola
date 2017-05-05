CREATE TRIGGER [dbo].[Table1AuditUpdTrig]
	ON [dbo].[Table1]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[Table1AuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
