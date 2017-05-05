CREATE TRIGGER [dbo].[RegionAuditUpdTrig]
	ON [dbo].[Region]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[RegionAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
