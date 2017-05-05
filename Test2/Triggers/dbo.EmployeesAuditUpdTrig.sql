CREATE TRIGGER [dbo].[EmployeesAuditUpdTrig]
	ON [dbo].[Employees]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeesAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
