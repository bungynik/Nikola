CREATE TRIGGER [dbo].[CustomersAuditDelTrig]
	ON [dbo].[Customers]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[CustomersAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
