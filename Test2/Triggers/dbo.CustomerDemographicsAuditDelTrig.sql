CREATE TRIGGER [dbo].[CustomerDemographicsAuditDelTrig]
	ON [dbo].[CustomerDemographics]
	AFTER
		DELETE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureDeleteBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[CustomerDemographicsAuditDelTrig]', @order='Last', @stmttype='DELETE'
GO
