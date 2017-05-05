CREATE TRIGGER [dbo].[ProductsAuditUpdTrig]
	ON [dbo].[Products]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[ProductsAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
