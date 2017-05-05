CREATE TRIGGER [dbo].[EmployeesAuditDelTrig]
	ON [dbo].[Employees]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeesAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
