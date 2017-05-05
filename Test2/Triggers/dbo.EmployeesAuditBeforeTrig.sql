SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.EmployeesAuditBeforeTrig
ON dbo.Employees
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @Tab VARBINARY(512)
	SET @Tab = CAST('Employees|dbo|' AS VARBINARY(512))
	SET CONTEXT_INFO @Tab
END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeesAuditBeforeTrig]', @order='First', @stmttype='INSERT'
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeesAuditBeforeTrig]', @order='First', @stmttype='DELETE'
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeesAuditBeforeTrig]', @order='First', @stmttype='UPDATE'
GO
