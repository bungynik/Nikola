CREATE TRIGGER [dbo].[CustomerDemographicsAuditUpdTrig]
	ON [dbo].[CustomerDemographics]
	AFTER
		UPDATE
AS
	EXTERNAL NAME [DataBeforeAfter].[ApexSql.Audit.BeforeAfter.CLRTrigger.ChangeCaptureTrigger].[CaptureUpdateBeforeAfter]
GO
EXEC sp_settriggerorder @triggername= '[dbo].[CustomerDemographicsAuditUpdTrig]', @order='Last', @stmttype='UPDATE'
GO
