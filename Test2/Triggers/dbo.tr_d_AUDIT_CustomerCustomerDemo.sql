SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_d_AUDIT_CustomerCustomerDemo]
ON [dbo].[CustomerCustomerDemo]
FOR DELETE

	NOT FOR REPLICATION

AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [dbo].[CustomerCustomerDemo]
-- Author:       ApexSQL Software
-- Date:		 9/19/2016 8:17:02 AM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[dbo].[CustomerCustomerDemo]'
	Select @ROWS_COUNT=count(*) from deleted
	Set @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

	INSERT
	INTO [NORTHWND].dbo.AUDIT_LOG_TRANSACTIONS
	(
		TABLE_NAME,
		TABLE_SCHEMA,
		AUDIT_ACTION_ID,
		HOST_NAME,
		APP_NAME,
		MODIFIED_BY,
		MODIFIED_DATE,
		AFFECTED_ROWS,
		[DATABASE]
	)
	values(
		'CustomerCustomerDemo',
		'dbo',
		3,	--	ACTION ID For DELETE
		CASE 
		  WHEN LEN(HOST_NAME()) < 1 THEN ' '
		  ELSE HOST_NAME()
		END,
		CASE 
		  WHEN LEN(APP_NAME()) < 1 THEN ' '
		  ELSE APP_NAME()
		END,
		SUSER_SNAME(),
		GETDATE(),
		@ROWS_COUNT,
		'NORTHWND'
	)

	
	Set @AUDIT_LOG_TRANSACTION_ID = SCOPE_IDENTITY()
	


	INSERT
	INTO [NORTHWND].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerID]=N'''+replace(CONVERT(nvarchar(4000), OLD.[CustomerID], 0), '''', '''''')+'''', '[CustomerID] Is Null') + ' AND ' + IsNull('[CustomerTypeID]=N'''+replace(CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0), '''', '''''')+'''', '[CustomerTypeID] Is Null')),
		'CustomerID',
		CONVERT(nvarchar(4000), OLD.[CustomerID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0))
	FROM deleted OLD
	WHERE
		OLD.[CustomerID] Is Not Null

	INSERT
	INTO [NORTHWND].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[CustomerID]=N'''+replace(CONVERT(nvarchar(4000), OLD.[CustomerID], 0), '''', '''''')+'''', '[CustomerID] Is Null') + ' AND ' + IsNull('[CustomerTypeID]=N'''+replace(CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0), '''', '''''')+'''', '[CustomerTypeID] Is Null')),
		'CustomerTypeID',
		CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CustomerTypeID], 0))
	FROM deleted OLD
	WHERE
		OLD.[CustomerTypeID] Is Not Null

	-- Lookup
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

END
GO
EXEC sp_settriggerorder @triggername= '[dbo].[tr_d_AUDIT_CustomerCustomerDemo]', @order='Last', @stmttype='DELETE'
GO
