CREATE TRIGGER [dbo].[ShippersAuditInsTrig]
	ON [dbo].[Shippers]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[ShippersAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
