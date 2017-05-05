CREATE TRIGGER [dbo].[SuppliersAuditInsTrig]
	ON [dbo].[Suppliers]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[SuppliersAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
