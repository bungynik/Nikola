CREATE TRIGGER [dbo].[EmployeesAuditInsTrig]
	ON [dbo].[Employees]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeesAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
