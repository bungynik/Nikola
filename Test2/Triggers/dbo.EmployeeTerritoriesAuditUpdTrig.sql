CREATE TRIGGER [dbo].[EmployeeTerritoriesAuditUpdTrig]
	ON [dbo].[EmployeeTerritories]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeeTerritoriesAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
