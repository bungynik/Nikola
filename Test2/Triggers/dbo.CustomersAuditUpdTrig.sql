CREATE TRIGGER [dbo].[CustomersAuditUpdTrig]
	ON [dbo].[Customers]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[CustomersAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
