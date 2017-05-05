SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER dbo.OrdersAuditBeforeTrig
ON dbo.Orders
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @Tab VARBINARY(512)
	SET @Tab = CAST('Orders|dbo|' AS VARBINARY(512))
	SET CONTEXT_INFO @Tab
END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[OrdersAuditBeforeTrig]', @order='First', @stmttype='INSERT'
GO
EXEC sp_settriggerorder @triggername= '[dbo].[OrdersAuditBeforeTrig]', @order='First', @stmttype='DELETE'
GO
EXEC sp_settriggerorder @triggername= '[dbo].[OrdersAuditBeforeTrig]', @order='First', @stmttype='UPDATE'
GO
