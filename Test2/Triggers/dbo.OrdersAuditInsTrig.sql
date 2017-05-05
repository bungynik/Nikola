CREATE TRIGGER [dbo].[OrdersAuditInsTrig]
	ON [dbo].[Orders]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[OrdersAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
