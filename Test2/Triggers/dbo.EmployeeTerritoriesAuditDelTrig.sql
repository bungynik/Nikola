CREATE TRIGGER [dbo].[EmployeeTerritoriesAuditDelTrig]
	ON [dbo].[EmployeeTerritories]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeeTerritoriesAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
