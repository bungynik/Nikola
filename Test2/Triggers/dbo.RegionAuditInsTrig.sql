CREATE TRIGGER [dbo].[RegionAuditInsTrig]
	ON [dbo].[Region]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[RegionAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
