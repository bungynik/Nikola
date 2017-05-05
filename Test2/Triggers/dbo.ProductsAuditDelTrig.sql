CREATE TRIGGER [dbo].[ProductsAuditDelTrig]
	ON [dbo].[Products]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[ProductsAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
