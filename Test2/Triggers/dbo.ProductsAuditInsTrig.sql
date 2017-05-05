CREATE TRIGGER [dbo].[ProductsAuditInsTrig]
	ON [dbo].[Products]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[ProductsAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
