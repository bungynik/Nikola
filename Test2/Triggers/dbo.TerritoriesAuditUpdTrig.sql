CREATE TRIGGER [dbo].[TerritoriesAuditUpdTrig]
	ON [dbo].[Territories]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[TerritoriesAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
