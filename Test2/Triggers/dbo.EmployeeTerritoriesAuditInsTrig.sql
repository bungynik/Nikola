CREATE TRIGGER [dbo].[EmployeeTerritoriesAuditInsTrig]
	ON [dbo].[EmployeeTerritories]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeeTerritoriesAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
