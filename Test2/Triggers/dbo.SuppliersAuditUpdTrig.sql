CREATE TRIGGER [dbo].[SuppliersAuditUpdTrig]
	ON [dbo].[Suppliers]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[SuppliersAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
