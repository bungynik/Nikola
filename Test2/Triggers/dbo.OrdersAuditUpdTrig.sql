CREATE TRIGGER [dbo].[OrdersAuditUpdTrig]
	ON [dbo].[Orders]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[OrdersAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
