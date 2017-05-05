CREATE TRIGGER [dbo].[SuppliersAuditDelTrig]
	ON [dbo].[Suppliers]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[SuppliersAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
