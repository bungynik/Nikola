SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.EmployeeTerritoriesAuditBeforeTrig
ON dbo.EmployeeTerritories
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @Tab VARBINARY(512)
	SET @Tab = CAST('EmployeeTerritories|dbo|' AS VARBINARY(512))
	SET CONTEXT_INFO @Tab
END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeeTerritoriesAuditBeforeTrig]', @order='First', @stmttype='INSERT'
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeeTerritoriesAuditBeforeTrig]', @order='First', @stmttype='DELETE'
GO
EXEC sp_settriggerorder @triggername= '[dbo].[EmployeeTerritoriesAuditBeforeTrig]', @order='First', @stmttype='UPDATE'
GO
