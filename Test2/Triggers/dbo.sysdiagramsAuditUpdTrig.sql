CREATE TRIGGER [dbo].[sysdiagramsAuditUpdTrig]
	ON [dbo].[sysdiagrams]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[sysdiagramsAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
