CREATE TRIGGER [dbo].[RegionAuditDelTrig]
	ON [dbo].[Region]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[RegionAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
