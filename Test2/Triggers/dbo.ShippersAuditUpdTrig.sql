CREATE TRIGGER [dbo].[ShippersAuditUpdTrig]
	ON [dbo].[Shippers]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[ShippersAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
