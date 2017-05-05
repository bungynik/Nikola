CREATE TRIGGER [dbo].[CustomerDemographicsAuditInsTrig]
	ON [dbo].[CustomerDemographics]
	AFTER
		INSERT
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureInsertBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[CustomerDemographicsAuditInsTrig]', @order='Last', @stmttype='INSERT'
GO
