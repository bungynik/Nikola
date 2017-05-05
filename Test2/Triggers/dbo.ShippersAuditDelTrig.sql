CREATE TRIGGER [dbo].[ShippersAuditDelTrig]
	ON [dbo].[Shippers]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[ShippersAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
