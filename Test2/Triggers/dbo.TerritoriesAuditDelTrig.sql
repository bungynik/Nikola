CREATE TRIGGER [dbo].[TerritoriesAuditDelTrig]
	ON [dbo].[Territories]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[TerritoriesAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
