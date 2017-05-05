CREATE TRIGGER [dbo].[OrdersAuditDelTrig]
	ON [dbo].[Orders]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[OrdersAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
