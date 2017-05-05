CREATE TRIGGER [dbo].[TerritoriesAuditInsTrig]
	ON [dbo].[Territories]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[TerritoriesAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
