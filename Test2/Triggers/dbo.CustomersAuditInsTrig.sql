CREATE TRIGGER [dbo].[CustomersAuditInsTrig]
	ON [dbo].[Customers]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[CustomersAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
